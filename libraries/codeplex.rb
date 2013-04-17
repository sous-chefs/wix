
require 'net/http'
require 'chef/json_compat'

class CodePlex

  # Downloading files from CodePlex requires a cookie and a Request
  # Verification Token. We capture the cookie and token with an initial GET
  # request followed by a post which returns JSON with a final download URL for
  # the file.
  def self.download_url(project_name, download_id)
    download_url = nil

    http = Net::HTTP.new("#{project_name}.codeplex.com")

    # GET /downloads/get/:ID for cookie and token
    resp = http.get("/downloads/get/#{download_id}")
    cookie = resp.to_hash['set-cookie'].collect{|ea|ea[/^.*?;/]}.join

    if resp.is_a?(Net::HTTPSuccess)

      # extract the RequestVerificationToken
      token = resp.body.match(/name="__RequestVerificationToken" type="hidden" value="(.*?)"/)[1]

      # POST /releases/captureDownload for a download url
      post_headers = {
        'Cookie' => cookie,
        'Content-Type' => 'application/x-www-form-urlencoded'
      }

      post_data = "fileId=#{download_id}&clickOncePath=&allowRedirectToAds=false&__RequestVerificationToken=#{token}"

      resp = http.post("/releases/captureDownload", post_data, post_headers)

      if resp.is_a?(Net::HTTPSuccess)
        download_url = Chef::JSONCompat.from_json(resp.body)['RedirectUrl']
      end
    end

    download_url
  end

end
