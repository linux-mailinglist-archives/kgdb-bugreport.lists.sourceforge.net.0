Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D0AD2980
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 10 Jun 2025 00:45:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6H4o5GA9JrsXR9YQqfRo0sEpXHFnvuhHoyNZTQtCes=; b=TwhYNifP71m/zaqt2rh+VOWXWP
	JVlchESrEkTKThG/cyNV3DZztYQCAvKWOhn78EGE5h3P/rFkMJw9Piq820kEYm16vlTJjfzrzJhwo
	CL8zfuaAmqbG58FPo0aPKePusmu8jCAOORszdWbPjp2c1ohyKYQzuR4Bx49sz0Er8LR4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uOlFG-0001Ao-Mw
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 09 Jun 2025 22:45:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uOlFF-0001Ac-JU
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 09 Jun 2025 22:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=; b=PSELFE9pnBolQMhfpHB62B3KYt
 y6uuNINcUQ3Z39Zmwv/5p41mDxTH+XkQSjA3ZTsj72Lm/AdLvo1EEAT2KvsugS6d8UMslJ7RdwkGN
 jib9PGbRVWNKrtX89TBVBXp7mqxnm1gQlsDsqGgdX29Ib2Nmyoh84KlH8ZtpI68Pz39E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=; b=Y4t/EWkD4CvcrjX3Hbq32LQjSE
 zEEOf6OiB6VhOmr9Z4tLU8XWpoPxjzYxnVQoSBLH6isa6cioQn2fdCqByP9xXmVzFyup/xBmM61ya
 kw1DABfl0K0DLDWdPQAMw6WryLVC6U5fGYpGzs+2fr2FQm5aGaieAOdx7ypEW0/4JK6A=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uOlFF-0001lf-6N for kgdb-bugreport@lists.sourceforge.net;
 Mon, 09 Jun 2025 22:45:33 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-74849e33349so1443338b3a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 09 Jun 2025 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1749509117; x=1750113917;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
 b=IeM6Uj/SM6dFfiekgtksI5G99d7rBatXfyVJZCpm4/SeHiX0ijn8Cb0ZtukFizx1gd
 7DN6ZtgfdglPBwS9MPWcGisQ8vS2K1pzbfefLp1uPD/pLuKbbMsfthhtndr3x6NJDT2F
 EosChIF7CfrRhS2FRevDUHclk58pPrRIF7ap0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749509117; x=1750113917;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a/LCGkPSUi11y6YDbtw03gAAN8X0aMlNFtkYip4Smws=;
 b=mqwV5qvAwilOD3Sm8fdEj+46d6jcv6Fb3cNiatmGCI4FIN7sC5129axC7ZrHCUWvAG
 Elr+tP2fzhM2pLdX8irBgOzLA2wEtN15ERWmF7Ey5otC/GXinXM50tdq/qXICf0mZZZz
 FxUtcNNA3Ctt+LTRJd+QG+8y+GQXygFZlc/un0tCY9R6SSv7sWN9O9RRfI0pAOGyaR2s
 +kVVwGWBRfFkzlLp1wpaLm4BxOCZaAreRU+HJRDTZ/Yf4p0sM1iKoASzMjr7lSmaJjja
 s4PCGPWTBPUmdY/YiCqeoNg/AwElmMocR9GAeoD7/EZM14V+GylVvLhh/ipDPxxGsBly
 Pmzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRnyVdqh+a9nhPW6Zt+JFMMJ1YlgeB6jnnK94mJl8DGiwauTitEDX66EzPtVyewsHmH320JwrQPVa9xVnPCQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw5gBz+GSne61oNgz/csQHBDzKA4RH5BiDlWE2/uiX8eCIQnrtW
 cGoj/2ltdt4XT4cQRup0+xFdlcMrlJ0L//3QJ72yl3cmu4cLJXfKOsN5f77CCoCWaMcG1eIU2rs
 xL98JaQ==
X-Gm-Gg: ASbGnctTDSlb8vckox7pYhn+eScCeBQ5Ls3o1OrrdSTG6EaUlm7FiB/5G5wwiA8Qq5K
 zhvLzBq3lw/owG5qnq/HKoqmEmT+kJHQCdOFDZ2TREL7OD5e/cD78LfNqJPmcIu5AISZbqUmlOW
 elKxSx2dNr/jp4jK9aSnd9rQRhQWs/3Wr8aA2CKeq+k6+rzjsQqSpWnOZla7wLlGEBWwhc1c3iY
 VJMEUAFh5u8liNbm04J+sU/GMOjBtMd9pa8I4HjZry/ntF96MqTBa7w0O60+cJoKQTB645dSRl1
 agDAvIb0qpAPu/gIAa2IifJ+uqmrX+aC585T7lyfQCWDkYpzlPRQXp+OoeMXiAMZxi8121kDJpE
 uFBIh8D5jhlHHOwzXArRLa8eKOQ==
X-Google-Smtp-Source: AGHT+IGHn+K4cL5zt8MB3791oPgMacScaO3YAFZFWlplKCG7BooyxDGD8osEF1iXRkgdUaXB3Ts79w==
X-Received: by 2002:a05:6a20:431f:b0:203:bb65:995a with SMTP id
 adf61e73a8af0-21f78c60acfmr837859637.30.1749509117460; 
 Mon, 09 Jun 2025 15:45:17 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482af38307sm6445225b3a.14.2025.06.09.15.45.15
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-3121aed2435so5186831a91.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 09 Jun 2025 15:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOufbFPbAVl15gy+VZowDrprYl6+1x05ihWycQQOGQwYtV3DGyZbbsWtZQgEFVQLb06YWUG5nwh8a/NcR8MA==@lists.sourceforge.net
X-Received: by 2002:a17:90b:6c7:b0:313:1a8c:c2c6 with SMTP id
 98e67ed59e1d1-313a1695527mr399198a91.16.1749509115055; Mon, 09 Jun 2025
 15:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250506125133.108786-1-nicolescu.roxana@protonmail.com>
 <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
In-Reply-To: <20250506125133.108786-3-nicolescu.roxana@protonmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:45:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
X-Gm-Features: AX0GCFvms_bTeu1m1tYJFabPtpRa0hg1AcW21wJUDi4AC8ourQTRpSPGDqEtFkQ
Message-ID: <CAD=FV=V2PSoakXH0_nKx1MkjPGXrHkFbPyMR=om9efW7LPn-dw@mail.gmail.com>
To: Roxana Nicolescu <nicolescu.roxana@protonmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, May 6,
 2025 at 5:51 AM Roxana Nicolescu <nicolescu.roxana@protonmail.com>
 wrote: > > The kgdboc uses a "fake" platform device to handle tty drivers
 showing > up late. In case the tty device is [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOlFF-0001lf-6N
Subject: Re: [Kgdb-bugreport] [RFC PATCH 2/2] serial: kgdboc: convert to use
 faux_device
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
Cc: rafael@kernel.org, gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, danielt@kernel.org, linux-serial@vger.kernel.org,
 jason.wessel@windriver.com, kgdb-bugreport@lists.sourceforge.net,
 dakr@kernel.org, jirislaby@kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUdWUsIE1heSA2LCAyMDI1IGF0IDU6NTHigK9BTSBSb3hhbmEgTmljb2xlc2N1Cjxu
aWNvbGVzY3Uucm94YW5hQHByb3Rvbm1haWwuY29tPiB3cm90ZToKPgo+IFRoZSBrZ2Rib2MgdXNl
cyBhICJmYWtlIiBwbGF0Zm9ybSBkZXZpY2UgdG8gaGFuZGxlIHR0eSBkcml2ZXJzIHNob3dpbmcK
PiB1cCBsYXRlLiBJbiBjYXNlIHRoZSB0dHkgZGV2aWNlIGlzIG5vdCBkZXRlY3RlZCBkdXJpbmcg
cHJvYmUsIGl0IHdpbGwKPiByZXR1cm4gRVBST0JFX0RFRkVSIHdoaWNoIG1lYW5zIHRoZSBwcm9i
ZSB3aWxsIGJlIGNhbGxlZCBsYXRlciB3aGVuIHRoZQo+IHR0eSBkZXZpY2UgbWlnaHQgYmUgdGhl
cmUuIEJlZm9yZSB0aGlzLCB0aGUga2dkYm9jIGRyaXZlcgo+IHdvdWxkIGJlIGluaXRpYWxpemVk
IGVhcmx5IGluIHRoZSBwcm9jZXNzICh1c2VmdWwgZm9yIGVhcmx5IGJvb3QKPiBkZWJ1Z2dpbmcp
IGJ1dCB0aGVuIHRoZSB0dHkgZGV2aWNlIHdvdWxkbid0IGJlIHRoZXJlLCBhbmQgcmV0cnkgd291
bGRuJ3QgYmUKPiBkb25lIGxhdGVyLiBGb3IgYSBiZXR0ZXIgZXhwbGFuYXRpb24sIHNlZSBjb21t
aXQKPiAnNjhlNTVmNjFjMTM4OiAoImtnZGJvYzogVXNlIGEgcGxhdGZvcm0gZGV2aWNlIHRvIGhh
bmRsZSB0dHkgZHJpdmVycwo+IHNob3dpbmcgdXAgbGF0ZSIpJy4KPgo+IFRoaXMgcmVwbGFjZXMg
dGhlIHBsYXRmb3JtX2RldmljZSB1c2FnZSB3aXRoIGZhdXhfZGV2aWNlIHdoaWNoIHdhcwo+IGlu
dHJvZHVjZWQgcmVjZW50bHkgZm9yIHNjZW5hcmlvcyBsaWtlIHRoaXMsIHdoZXJlIHRoZXJlIGlz
IG5vdCByZWFsCj4gcGxhdGZvcm0gZGV2aWNlIG5lZWRlZC4gTW9yZW92ZXIsIGl0IG1ha2VzIHRo
ZSBjb2RlIGNsZWFuZXIgdGhhbiBiZWZvcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3hhbmEgTmlj
b2xlc2N1IDxuaWNvbGVzY3Uucm94YW5hQHByb3Rvbm1haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L3R0eS9zZXJpYWwva2dkYm9jLmMgfCA1MCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMgYi9kcml2ZXJz
L3R0eS9zZXJpYWwva2dkYm9jLmMKPiBpbmRleCA4NWY2YzVhNzZlMGYuLmQxZmZlNjE4NjY4NSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMKPiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwva2dkYm9jLmMKPiBAQCAtMjEsNyArMjEsNyBAQAo+ICAjaW5jbHVkZSA8bGlu
dXgvaW5wdXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lycV93b3JrLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KPiAtI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvZGV2aWNlL2ZhdXguaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF9j
b3JlLmg+Cj4KPiAgI2RlZmluZSBNQVhfQ09ORklHX0xFTiAgICAgICAgIDQwCj4gQEAgLTQyLDcg
KzQyLDcgQEAgc3RhdGljIGludCBrZ2Rib2NfdXNlX2ttczsgIC8qIDEgaWYgd2UgdXNlIGtlcm5l
bCBtb2RlIHN3aXRjaGluZyAqLwo+ICBzdGF0aWMgc3RydWN0IHR0eV9kcml2ZXIgICAgICAgKmtn
ZGJfdHR5X2RyaXZlcjsKPiAgc3RhdGljIGludCAgICAgICAgICAgICAgICAgICAgIGtnZGJfdHR5
X2xpbmU7Cj4KPiAtc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmtnZGJvY19wZGV2Owo+
ICtzdGF0aWMgc3RydWN0IGZhdXhfZGV2aWNlICprZ2Rib2NfZmRldjsKPgo+ICAjaWYgSVNfQlVJ
TFRJTihDT05GSUdfS0dEQl9TRVJJQUxfQ09OU09MRSkKPiAgc3RhdGljIHN0cnVjdCBrZ2RiX2lv
ICAgICAgICAgIGtnZGJvY19lYXJseWNvbl9pb19vcHM7Cj4gQEAgLTI1OSw3ICsyNTksNyBAQCBz
dGF0aWMgaW50IGNvbmZpZ3VyZV9rZ2Rib2Modm9pZCkKPiAgICAgICAgIHJldHVybiBlcnI7Cj4g
IH0KPgo+IC1zdGF0aWMgaW50IGtnZGJvY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICtzdGF0aWMgaW50IGtnZGJvY19wcm9iZShzdHJ1Y3QgZmF1eF9kZXZpY2UgKmZkZXYp
Cj4gIHsKPiAgICAgICAgIGludCByZXQgPSAwOwo+Cj4gQEAgLTI3Niw0NyArMjc2LDI2IEBAIHN0
YXRpYyBpbnQga2dkYm9jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiAtc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
a2dkYm9jX3BsYXRmb3JtX2RyaXZlciA9IHsKPiArc3RydWN0IGZhdXhfZGV2aWNlX29wcyBrZ2Ri
b2NfZHJpdmVyID0gewoKbml0OiBzL2tnZGJvY19kcml2ZXIva2dkYm9jX2ZhdXhfb3BzLyA/CgpP
dGhlciB0aGFuIHRoYXQsIHRoaXMgc2VlbXMgcmVhc29uYWJsZSB0byBtZS4gSSBndWVzcyBJJ2Qg
YXNzdW1lIHRoYXQKR3JlZyB3b3VsZCBjaGltZSBpbiBhdCBzb21lIHBvaW50IHNpbmNlIHBhdGNo
ICMxIGluIHRoaXMgc2VyaWVzIHdvdWxkCm5lZWQgdG8gZ28gdGhyb3VnaCBoaW0uCgotRG91ZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVn
cmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBv
cnQK
