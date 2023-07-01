Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C5744A71
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  1 Jul 2023 18:09:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qFd9p-0001Ol-W9
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 01 Jul 2023 16:09:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qFd9o-0001Of-DB
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 16:09:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=; b=Ug5Gwt3ILL7WnarfX1UeuwJvhZ
 EutuJGcG1OtN1raibs0lgdcvUZ2rM//IzSk+xxgAGv9mOimWkHjxRYalIq7QGi4/LaN7UXO19zvcn
 ex9hdRi9QdUc1Uoe2pbAGtRyFf4AF7/plCKz2/1LQz7/NiISfrTVDxmh/KVJldKIy/lE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=; b=X5mqn+Xj318+HcX5W5JFu79irT
 0w+2n5doB/Y1diO/1oXG6JlbsWIMd4T4aA/EBV9AOwK2X8uZKHiP2fVP1SB6QBBX0sEyXNneQSMZ4
 uSOYVTymMdVhaNE9Ug3CKHK4HL8p80dq6CrUFViRFvhlOmxPo3jJEX7h2p1wKWBLDq8o=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qFd9n-0039eW-Oj for kgdb-bugreport@lists.sourceforge.net;
 Sat, 01 Jul 2023 16:09:08 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b6a1245542so48945261fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 01 Jul 2023 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688227740; x=1690819740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=;
 b=UZYCFRSzR+fLKW3hjwx6MJoSjyPdFqdjl04g2hUifIPlH3Pci7Lps7Lmay/4wTw/q8
 4fOftK0DL494NLdIQAc2qDSGJmWAwHoSYmGWoH1bv5bQIg02N1NCkR2scq9hIgqm+bGL
 6eoLgF0hMWHXmvbfMg1LbdiOfkdEzJmnkDH/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688227740; x=1690819740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=;
 b=YQy3nkvzY3qEw2A14Zn7EJclgqSnMdkrFC+RIXsdRRG3PACG/8nN1YBBP/QozO035i
 PzMJ36Y3eWUYPh7cmIjGGy16NwgGTlG8NiK1H0WVQjgMPt2Tz+brL56cG1MHsydREMak
 XiIEaM+JwOyK45oa4FXBgWQD5JCLRcppbgdcRNVOcohgba2JlnHgS49I9gKgGsIiki0K
 9qiQipq38pCQq6Pu9BwHHS1JBOu1asPrQCzxoEqUIT3r6KiynGoORLwDdqJ8QyP/8AXl
 g2ZsuVLbJGtEol+7g4Q/pGEbFYpPf49C9KxTmJfHv57pY4SkasQoFOTXhx+nEcvZ2jrl
 TrUA==
X-Gm-Message-State: ABy/qLboXJ7okntGRkkMn6m7snqNv1QeJgpQodIHV8OYf9Gq5551o4ZT
 c8zQRVMEuZBj2a8C8eukTATsRn4hq4D+6YyTGHDuB8X5
X-Google-Smtp-Source: APBJJlHphpSW0Zl4wB5IxVlqP0eLme2XRZUCqtSJOQIpxFCZGY8X7vOCqICDfMQKNay2qUV+iTAWHQ==
X-Received: by 2002:a2e:a0c8:0:b0:2b6:d8e4:71b3 with SMTP id
 f8-20020a2ea0c8000000b002b6d8e471b3mr1879912ljm.21.1688227740512; 
 Sat, 01 Jul 2023 09:09:00 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 l17-20020a2e8691000000b002b6a6574313sm2848584lji.62.2023.07.01.09.08.56
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jul 2023 09:08:59 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4fb0336ed4fso1424e87.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 01 Jul 2023 09:08:56 -0700 (PDT)
X-Received: by 2002:a19:ee17:0:b0:4f2:7840:e534 with SMTP id
 g23-20020a19ee17000000b004f27840e534mr36733lfb.0.1688227736365; Sat, 01 Jul
 2023 09:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
In-Reply-To: <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 1 Jul 2023 09:08:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
Message-ID: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sat, Jul 1, 2023 at 7:40 AM Guenter Roeck <linux@roeck-us.net>
    wrote: > > On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote: >
    > The HAVE_ prefix means that the code could be enabled. A [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.182 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qFd9n-0039eW-Oj
Subject: Re: [Kgdb-bugreport] [PATCH v2 6/6] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTYXQsIEp1bCAxLCAyMDIzIGF0IDc6NDDigK9BTSBHdWVudGVyIFJvZWNrIDxsaW51
eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMDU6MDY6
MThQTSArMDIwMCwgUGV0ciBNbGFkZWsgd3JvdGU6Cj4gPiBUaGUgSEFWRV8gcHJlZml4IG1lYW5z
IHRoYXQgdGhlIGNvZGUgY291bGQgYmUgZW5hYmxlZC4gQWRkIGFub3RoZXIKPiA+IHZhcmlhYmxl
IGZvciBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSCB3aXRob3V0IHRoaXMgcHJlZml4Lgo+
ID4gSXQgd2lsbCBiZSBzZXQgd2hlbiBpdCBzaG91bGQgYmUgYnVpbHQuIEl0IHdpbGwgbWFrZSBp
dCBjb21wYXRpYmxlCj4gPiB3aXRoIHRoZSBvdGhlciBoYXJkbG9ja3VwIGRldGVjdG9ycy4KPiA+
Cj4gPiBUaGUgY2hhbmdlIGFsbG93cyB0byBjbGVhbiB1cCBkZXBlbmRlbmNpZXMgb2YgUFBDX1dB
VENIRE9HCj4gPiBhbmQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgZGVmaW5pdGlvbnMg
Zm9yIHBvd2VycGMuCj4gPgo+ID4gQXMgYSByZXN1bHQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9S
X1BFUkYgaGFzIHRoZSBzYW1lIGRlcGVuZGVuY2llcwo+ID4gb24gYXJtLCB4ODYsIHBvd2VycGMg
YXJjaGl0ZWN0dXJlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiAuLi4KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbm1pLmgK
PiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbm1pLmgKPiA+IEBAIC05LDcgKzksNyBAQAo+ID4gICNp
bmNsdWRlIDxhc20vaXJxLmg+Cj4gPgo+ID4gIC8qIEFyY2ggc3BlY2lmaWMgd2F0Y2hkb2dzIG1p
Z2h0IG5lZWQgdG8gc2hhcmUgZXh0cmEgd2F0Y2hkb2ctcmVsYXRlZCBBUElzLiAqLwo+ID4gLSNp
ZiBkZWZpbmVkKENPTkZJR19IQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSCkgfHwgZGVmaW5l
ZChDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9TUEFSQzY0KQo+ID4gKyNpZiBkZWZpbmVkKENP
TkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gpIHx8IGRlZmluZWQoQ09ORklHX0hBUkRMT0NL
VVBfREVURUNUT1JfU1BBUkM2NCkKPgo+IFRoaXMgcmVzdWx0cyBpbjoKPgo+IGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvcHNlcmllcy9tb2JpbGl0eS5jOiBJbiBmdW5jdGlvbiAncHNlcmllc19taWdy
YXRlX3BhcnRpdGlvbic6Cj4gYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL21vYmlsaXR5
LmM6NzUzOjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3dhdGNo
ZG9nX2hhcmRsb2NrdXBfc2V0X3RpbWVvdXRfcGN0JzsgZGlkIHlvdSBtZWFuICd3YXRjaGRvZ19o
YXJkbG9ja3VwX3N0b3AnPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgIDc1MyB8ICAgICAgICAgICAgICAgICB3YXRjaGRvZ19oYXJkbG9ja3VwX3NldF90aW1lb3V0
X3BjdChmYWN0b3IpOwo+Cj4gd2l0aCBwcGM2NF9kZWZjb25maWcgLUNPTkZJR19IQVJETE9DS1VQ
X0RFVEVDVE9SLCBiZWNhdXNlIHRoZSBkdW1teQo+IGZvciB3YXRjaGRvZ19oYXJkbG9ja3VwX3Nl
dF90aW1lb3V0X3BjdCgpIGlzIHN0aWxsIGRlZmluZWQgaW4KPiBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbm1pLmggd2hpY2ggaXMgbm8gbG9uZ2VyIGluY2x1ZGVkLgoKQ2FuIHlvdSB0ZXN0IHdp
dGg6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNjI5MTI0NTAwLjEuSTU1ZTJmNGU3
OTAzZDY4NmM0NDg0Y2IyM2MwMzNjNmE5ZTFhOWQ0YzRAY2hhbmdlaWQKClRoYW5rcyEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9y
dCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
