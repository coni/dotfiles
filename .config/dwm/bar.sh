while true;
do
    xsetroot -name "$(timeout 1 sptlrx pipe)"
    sleep 1
done
