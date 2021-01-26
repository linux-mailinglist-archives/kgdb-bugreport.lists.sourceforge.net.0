Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194D303928
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Koq-0008Ne-1m
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stephenzhangzsd@gmail.com>) id 1l4DBl-0007zt-EY
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 01:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nEdmF1voGnlMsgyYH03PSeh6mJ1eZb8wdhW3DDv/rZ8=; b=leyUckNi18T8LMLlSnU4Nbdoj/
 gKCIfHcqL1JfeiYarFo/pOIsramSdl3jSTEcfr8iZ3r/mgVMsPMKFqVeiv60FS1PkQo+FRnwE37YP
 frAAD++fkSq73ynLn89EWSS9dalFpaLufi/OFhgzGVRSqHn1mioBCLzDuGGN4vymucEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nEdmF1voGnlMsgyYH03PSeh6mJ1eZb8wdhW3DDv/rZ8=; b=clAVagFccLrmerpQb7MwEPbKMQ
 e8I4Outk9HFSI6+7lja7ie8nT6qr7+8poN1Y27YeEMC8sCDSm1/5iVf2vEYUyGRB6YEkSIq8ftS8M
 y4JgjrnJUt3TlCYY+F+yJyoHIl6Iy0i37WImvK9G6cUAhHbEeTw/drpskS6p0+Ok8cWs=;
Received: from mail-yb1-f182.google.com ([209.85.219.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l4DBd-0054KZ-Ua
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 Jan 2021 01:30:37 +0000
Received: by mail-yb1-f182.google.com with SMTP id y128so15197836ybf.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 17:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nEdmF1voGnlMsgyYH03PSeh6mJ1eZb8wdhW3DDv/rZ8=;
 b=MF61YbpBp//xscBtigSQj9oGEJO4/+LW3mUQwGArEukdu9sXwi3a5wXjHBlH/NoYOf
 nzeI3OVmN/rXlSg0rvAhzt4RnGE6XBlavJqQOJmPn/p0FYQcO++urK7Dl7zLX7keXjdz
 LsSCy/KEOa0Dg3q7BHIMWegrzYjD9+6JA/EHA/DODuCyv00mVodTdzqYjJRP3syHW8p5
 pXunkGYhqBd4ZTWNkTSHKX/ova8ArLdV3+20SCGU+SrzhbpZEN4RW8JVQumDV2wLNuzI
 inKnfDG+07Fdk/0MKwCPj5fbCf62MhEpBUUZYguIfVHiOPByGOmS/IzNUp8mC9PCOgHx
 DVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nEdmF1voGnlMsgyYH03PSeh6mJ1eZb8wdhW3DDv/rZ8=;
 b=sDsHG3Jpk2w7g0ZEusbYIIkYFKA1kRkr89E6/4MOjpXDRkCL35IFH3WxF7APwy4Oap
 wBlwm1N4cuE/gIrMQsbbwWw7XeejV6qVPJvKkCszIkPnVnSqjr9X9XYwrpkLU4ddgLDo
 KYpuEIu/AZsc6L8BnSLYqWasfcfm/w5y9U13TAr29AuchJMhg+utAFdyIDM0rnqv1IRu
 4BIZuvcMPg2z2cdXvuoMRvTWXvX4B+4DF7hYrrNtOFm8bnqSuQc7PEZabseu0yTJqtTZ
 nJFXStl8czGAO34mPyutPJl6Ef5+ilXRhMGnrDh2NtId7ZzVVYqht/nQaWOHjgzgCip1
 2+LQ==
X-Gm-Message-State: AOAM5327SLkyMZeEADolqosPQMFvB7Tae1E68H+BiMi6eHcryFRZZ+2t
 Hjh+vIYd1VsviepfDmruSVS3VNyFFu/LHZbfo1E=
X-Google-Smtp-Source: ABdhPJxWyJkDPg7e8M9kukbmMgSSJUIHVkufCMklcfL9GWQPleCWIPPW1jXdqZc/YLusAFla+ADnTpNusSCJ9P02Y48=
X-Received: by 2002:a25:ad91:: with SMTP id z17mr5183640ybi.260.1611624617290; 
 Mon, 25 Jan 2021 17:30:17 -0800 (PST)
MIME-Version: 1.0
References: <1611400441-7178-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
In-Reply-To: <CAD=FV=V6iEr5Xj53hvrQK+48xGm=s_GYQuyD_vgMM3Zknw5yOw@mail.gmail.com>
From: Stephen Zhang <stephenzhangzsd@gmail.com>
Date: Tue, 26 Jan 2021 09:30:06 +0800
Message-ID: <CALuz2=dH+fuHi6jHvBNzY=ZLMRdgRx1jKxdmEQ_SECZj7_skGQ@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (stephenzhangzsd[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4DBd-0054KZ-Ua
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:25 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: kdb_support: replace function
 name by %s
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

VGhhbmtzLkkgd2lsbCBtYWtlIGEgMm5kIHBhdGNoLgoKRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPiDkuo4yMDIx5bm0MeaciDI25pel5ZGo5LqMIOS4iuWNiDE6NTblhpnpgZPv
vJoKCj4gSGksCj4KPiBPbiBTYXQsIEphbiAyMywgMjAyMSBhdCAzOjE0IEFNIFN0ZXBoZW4gWmhh
bmcgPHN0ZXBoZW56aGFuZ3pzZEBnbWFpbC5jb20+Cj4gd3JvdGU6Cj4gPgo+ID4gQmV0dGVyIHRv
IHJlcGxhY2UgZnVuY3Rpb24gbmFtZSBieSAlcyBpbiBjYXNlIG9mIGNoYW5nZXMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogU3RlcGhlbiBaaGFuZyA8c3RlcGhlbnpoYW5nenNkQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX3N1cHBvcnQuYyB8IDMyICsrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvZGVidWcv
a2RiL2tkYl9zdXBwb3J0LmMKPiBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX3N1cHBvcnQuYwo+ID4g
aW5kZXggNjIyNjUwMi4uN2E1MzZmYyAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9kZWJ1Zy9rZGIv
a2RiX3N1cHBvcnQuYwo+ID4gKysrIGIva2VybmVsL2RlYnVnL2tkYi9rZGJfc3VwcG9ydC5jCj4g
PiBAQCAtNDAsMTkgKzQwLDE5IEBACj4gPiAgaW50IGtkYmdldHN5bXZhbChjb25zdCBjaGFyICpz
eW1uYW1lLCBrZGJfc3ltdGFiX3QgKnN5bXRhYikKPiA+ICB7Cj4gPiAgICAgICAgIGlmIChLREJf
REVCVUcoQVIpKQo+ID4gLSAgICAgICAgICAgICAgIGtkYl9wcmludGYoImtkYmdldHN5bXZhbDog
c3ltbmFtZT0lcywgc3ltdGFiPSVweFxuIiwKPiBzeW1uYW1lLAo+ID4gKyAgICAgICAgICAgICAg
IGtkYl9wcmludGYoIiVzOiBzeW1uYW1lPSVzLCBzeW10YWI9JXB4XG4iLCBfX2Z1bmNfXywKPiBz
eW1uYW1lLAo+Cj4gR2l2ZW4gdGhlIGNvbW1vbiBwYXR0ZXJuOgo+Cj4gaWYgKEtEQl9ERUJVRyhB
UikpCj4gICBrZGJfcHJpbnRmKC4uLikKPgo+IEkgd29uZGVyIGlmIHdlIGNvdWxkIGltcHJvdmUg
dGhpcyB0byB0aGlzICh1bnRlc3RlZCk6Cj4KPiAjZGVmaW5lIGtkYl9hcmRiZ19wcmludGYoZm9y
bWF0LCAuLi4pIFwKPiAgIGRvIHsgXAo+ICAgICBpZiAoS0RCX0RFQlVHKEFSKSkgXAo+ICAgICAg
IGtkYl9wcmludGYoIiVzOiAiIGZvcm1hdCwgX19mdW5jX18sIF9fVkFfQVJHU19fKTsgXAo+ICAg
fSB3aGlsZSAoMCkKPgo+IFRoZW4gdGhlIGFib3ZlIGp1c3QgYmVjb21lczoKPgo+IGtkYl9hcmRi
Z19wcmludGYoInN5bW5hbWU9JXMsIHN5bXRhYj0lcHhcbiIsIHN5bW5hbWUsCj4KPgo+ID4gQEAg
LTQzNSw3ICs0MzUsNyBAQCBpbnQga2RiX2dldHBoeXN3b3JkKHVuc2lnbmVkIGxvbmcgKndvcmQs
IHVuc2lnbmVkCj4gbG9uZyBhZGRyLCBzaXplX3Qgc2l6ZSkKPiA+ICAgICAgICAgICAgICAgICBm
YWxsdGhyb3VnaDsKPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+ICAgICAgICAgICAgICAgICBkaWFn
ID0gS0RCX0JBRFdJRFRIOwo+ID4gLSAgICAgICAgICAgICAgIGtkYl9wcmludGYoImtkYl9nZXRw
aHlzd29yZDogYmFkIHdpZHRoICVsZFxuIiwgKGxvbmcpCj4gc2l6ZSk7Cj4gPiArICAgICAgICAg
ICAgICAga2RiX3ByaW50ZigiJXM6IGJhZCB3aWR0aCAlbGRcbiIsIF9fZnVuY19fLCAobG9uZykg
c2l6ZSk7Cj4KPiBVbnJlbGF0ZWQgdG8geW91ciBwYXRjaCwgYnV0IGlmIHlvdSB3YW50IGEgMm5k
IHBhdGNoIHlvdSBjb3VsZCBmaXggaXQKPiB0byBub3QgY2FzdCAic2l6ZSIgdG8gYSBsb25nIGFu
ZCB1c2UgdGhlIHByb3BlciBmb3JtYXQgY29kZSBmb3IgYQo+IHNpemVfdCAoJXp1KQo+Cj4KPiA+
IEBAIC00ODQsNyArNDg0LDcgQEAgaW50IGtkYl9nZXR3b3JkKHVuc2lnbmVkIGxvbmcgKndvcmQs
IHVuc2lnbmVkIGxvbmcKPiBhZGRyLCBzaXplX3Qgc2l6ZSkKPiA+ICAgICAgICAgICAgICAgICBm
YWxsdGhyb3VnaDsKPiA+ICAgICAgICAgZGVmYXVsdDoKPiA+ICAgICAgICAgICAgICAgICBkaWFn
ID0gS0RCX0JBRFdJRFRIOwo+ID4gLSAgICAgICAgICAgICAgIGtkYl9wcmludGYoImtkYl9nZXR3
b3JkOiBiYWQgd2lkdGggJWxkXG4iLCAobG9uZykgc2l6ZSk7Cj4gPiArICAgICAgICAgICAgICAg
a2RiX3ByaW50ZigiJXM6IGJhZCB3aWR0aCAlbGRcbiIsIF9fZnVuY19fLCAobG9uZykgc2l6ZSk7
Cj4KPiBUaGlzIGFsc28gY291bGQgZ2V0IHRoZSBjb3JyZWN0IGZvcm1hdCBjb2RlLgo+Cj4KPiA+
IEBAIC01MjgsNyArNTI4LDcgQEAgaW50IGtkYl9wdXR3b3JkKHVuc2lnbmVkIGxvbmcgYWRkciwg
dW5zaWduZWQgbG9uZwo+IHdvcmQsIHNpemVfdCBzaXplKQo+ID4gICAgICAgICAgICAgICAgIGZh
bGx0aHJvdWdoOwo+ID4gICAgICAgICBkZWZhdWx0Ogo+ID4gICAgICAgICAgICAgICAgIGRpYWcg
PSBLREJfQkFEV0lEVEg7Cj4gPiAtICAgICAgICAgICAgICAga2RiX3ByaW50Zigia2RiX3B1dHdv
cmQ6IGJhZCB3aWR0aCAlbGRcbiIsIChsb25nKSBzaXplKTsKPiA+ICsgICAgICAgICAgICAgICBr
ZGJfcHJpbnRmKCIlczogYmFkIHdpZHRoICVsZFxuIiwgX19mdW5jX18sIChsb25nKSBzaXplKTsK
Pgo+IC4uLmFuZCB0aGlzLgo+Cj4gSW4gYW55IGNhc2UsIGFsbCBteSBjb21tZW50cyBhcmUgbml0
cyBhbmQvb3IgdGhpbmdzIHRoYXQgc2hvdWxkIGhhcHBlbgo+IGluIGEgMm5kIGFuZCB5b3VyIHBh
dGNoIGltcHJvdmVzIHRoaW5ncy4gIFRodXM6Cj4KPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1i
dWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
