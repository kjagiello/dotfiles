function share --description 'Shares files using files.kjagiello.com'
    if test (count $argv) -ne 1
        echo 'Usage: share [filename]'
        return
    end

    set -l random_token (openssl rand -hex 4)
    set -l filename $random_token'_'$argv

    scp $argv kjagiello.com:/srv/www/files.kjagiello.com/$filename

    set -l url 'https://files.kjagiello.com/'$filename
    echo $url | pbcopy
    echo 'The link to the file is now in your clipboard.'
end
