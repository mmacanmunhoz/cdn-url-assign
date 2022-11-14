package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"

	"github.com/aws/aws-sdk-go/service/cloudfront/sign"
)

func main() {
	keyID := "KS3KEN4NJA2H8"  
	privKeyPath := "./content-files-key" 
	url := "https://d1wviyql9igy8r.cloudfront.net/url.txt"  
	expireAt := time.Now().Add(24 * time.Hour)
    
	privKey, err := sign.LoadPEMPrivKeyFile(privKeyPath)
	if err != nil {
		log.Fatalf("Load private key from %s failed\n", privKeyPath)
	}

	URLSigner := sign.NewURLSigner(keyID, privKey)

	signedURL, err := URLSigner.Sign(url, expireAt)
	if err != nil {
		log.Fatal("generate signed url failed:", err)
	}
	fmt.Printf("access signedURL: %s\ncontent: %s", signedURL, httpGet(signedURL))

}

func httpGet(url string) string {
	res, err := http.Get(url)

	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()

	data, _ := ioutil.ReadAll(res.Body)

	return fmt.Sprintf("%s", data)
}

