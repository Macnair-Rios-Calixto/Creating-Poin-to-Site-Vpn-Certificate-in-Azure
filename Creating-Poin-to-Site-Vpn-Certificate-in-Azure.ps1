#Creating-Poin-to-Site-Vpn-Certificate-in-Azure

#Server Root Certificate
$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=Certificado-Root" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign


#Client Certificate
New-SelfSignedCertificate -Type Custom -DnsName P2SChildCertAzure -KeySpec Signature `
-Subject "CN=Certificado-Cliente" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")

