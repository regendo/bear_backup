class BearBackup < Formula
  desc "Bear backup utility"
  homepage "https://github.com/regendo/bear_backup"
  head "git@github.com:regendo/bear_backup", :using => :git

  depends_on "python3"
  depends_on "git"

  def install
    bin.mkpath
	 bin.install "bear_backup.py"
	 bin.install "autocommit.sh"
  end

  plist_options :manual => "bear_backup"

  def plist
    <<-EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
    <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>EnvironmentVariables</key>
        <dict>
            <key>PATH</key>
            <string>/bin:/usr/bin:/usr/local/bin</string>
        </dict>
        <key>ProgramArguments</key>
        <array>
            <string>#{HOMEBREW_PREFIX}/bin/bear_backup.py</string>
            <string>--notify</string>
            <string>--remove</string>
            <string>--commit</string>
            <string>~/OneDrive/Documents/bear.app Notes archive</string>
        </array>
        <key>RunAtLoad</key>
        <false/>
        <key>StartCalendarInterval</key>
        <dict>
            <key>Minute</key>
            <integer>10</integer>
        </dict>
    </dict>
</plist>
EOF
  end

  test do
    system bin/"bear_backup.py", "--help"
  end
end
