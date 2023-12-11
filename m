Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A780EFAC
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 12 Dec 2023 16:08:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rD4NO-0002HM-V6
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 12 Dec 2023 15:08:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michael@amarulasolutions.com>) id 1rCoPk-0000Ri-6C
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvsjJYhvv+f3XhbCRuq+pRr1LNIA+hk6SC/AnSsJPwU=; b=M/L06yceXs7c5ClUSkoJfmln36
 nIPPpaTQ8jcxNWPr4imKvZ8hGl4TzPXcxU8XqmAJ+Ry74l6yFSmNWYjfN7JETfrRD4SQZq4l+9DqZ
 qJLPBXpO4MK+44d8oxxMQ84u2r4PNmhzJrlUqkKSmExzGFPs71HNsT1K8cdjACl2fep8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wvsjJYhvv+f3XhbCRuq+pRr1LNIA+hk6SC/AnSsJPwU=; b=Jg1PVxZe9ZzjDfdw61rdWWoakd
 /mUtn4dvfHu03b/+cDam4v6BBGPdhcxO0Vh4uF6tf6nQkPzWkBhv2orQktyq/DA2FolfePbrDnNE7
 LTFzpzRx9l33Fl17WljDBH63iCCxnfWup6B2YCpCsnzOXT2giRV9UGoiURHpr/k27FHw=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rCoPe-0005eL-UB for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:06:12 +0000
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2c9f9db9567so57542781fa.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Dec 2023 14:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332360; x=1702937160;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wvsjJYhvv+f3XhbCRuq+pRr1LNIA+hk6SC/AnSsJPwU=;
 b=fric56xf/hEmT1+OZCemmblXTzQU8NnA+ir0/inm4OHe53wx2cIm+03/TbxmcnL0Gq
 V3NGIrlfToU03VSbPDNDSCLPmbNnVI3N8/NoU5KWjShSJPVwaQqfwj0Yk60/4hRXx73m
 DtwbVVU7I3Vt4TvmViCbWZHCz6kDA9HUFJkd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332360; x=1702937160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wvsjJYhvv+f3XhbCRuq+pRr1LNIA+hk6SC/AnSsJPwU=;
 b=YTX8EG+QLW0K7rwsCTwynaS2gCwDdeIDkQNV1MxtdM8oI2H0CLV4jVV1VePCaYwW+K
 Z6fLC6v93f3w+StkJMtLEa8QpjbLz9bVIHBQDn47IN3RO6lWrdUxFdpu5tK/4Ry2NgWB
 2lTOsmYNE0Vspkh/a2Te/KAfRPzN4DyCkGby5n/frDu+mG22879EI5c9XCPAoy/MwTj3
 mb8jI5pjWCAw3ulq8KHoxiH1LCMsncQ1Z2Die0SaL+YEWjaUSvf5bQ0ZdPhu4b9LneMV
 HqAbzoZJs0/r5afJhvucC/EVvfKAzW4sFO+jIiVVq4gYSlKYe0okBptRlLh8BrCNFCPC
 v1gw==
X-Gm-Message-State: AOJu0YzlEeyFSuZOjGWQyAY1kcLa69FrACp+k5nbop2RoByeOzTAH5Xx
 lB/zxIPyk/LZIYPv7Blyu1uO45ykD5EpaSp7WZ0ihD9rMnFmJ3pkOqc=
X-Google-Smtp-Source: AGHT+IGO08YwcWoHffIjPKsmKnNAUPGDJA8ps+hKzMpypaXrMSG0zTtD5hF3mlUQITNjMkYpgLnCjXwk5kWb23oeOPQ=
X-Received: by 2002:a17:907:2596:b0:a0e:d93a:3202 with SMTP id
 ad22-20020a170907259600b00a0ed93a3202mr2056769ejc.4.1702330918966; Mon, 11
 Dec 2023 13:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
 <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
In-Reply-To: <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 11 Dec 2023 22:41:46 +0100
Message-ID: <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Doug On Mon, Dec 11, 2023 at 10:39 PM Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Fri, Dec 8, 2023 at 1:28 PM Michael Trimarchi > <michael@amarulasolutions.com>
    wrote: > > > > Use late_ [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rCoPe-0005eL-UB
X-Mailman-Approved-At: Tue, 12 Dec 2023 15:08:50 +0000
Subject: Re: [Kgdb-bugreport] [RFC PATCH] tty: serial: kgdboc: Fix 8250_*
 kgd over serial
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGkgRG91ZwoKT24gTW9uLCBEZWMgMTEsIDIwMjMgYXQgMTA6MznigK9QTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBGcmksIERlYyA4
LCAyMDIzIGF0IDE6MjjigK9QTSBNaWNoYWVsIFRyaW1hcmNoaQo+IDxtaWNoYWVsQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPiB3cm90ZToKPiA+Cj4gPiBVc2UgbGF0ZV9pbml0Y2FsbF9zeW5jIGluc3Rl
ZCBvZiBtb2R1bGUgaW5pdCB0byBiZSBzdXJlIHRoYXQKPiA+IHNlcmlhbCBkcml2ZXIgaXMgcmVh
bGx5IHByb2JlZCBhbmQgZ2V0IHRha2UgaGFuZG92ZXIgZnJvbQo+ID4gZWFybHkgZHJpdmVyLgo+
Cj4gQXdlc29tZSB0aGF0IHlvdSB1c2VkIHRoZSBlYXJseWNvbiBkcml2ZXIgdG8gZGVidWcgcHJv
YmxlbXMgd2l0aAo+IHJlZ2lzdGVyaW5nIHRoZSBub3JtYWwgZHJpdmVyISA6LVAKPgo+Cj4gPiBU
aGUgODI1MCByZWdpc3RlciB0aGUgcGxhdGZvcm0gZHJpdmVyIGFmdGVyCj4gPiB0aGUgODI1MCBj
b3JlIGlzIGluaXRpYWxpemVkLiBBcyBzaG93biBieSBrZGJnCj4gPgo+ID4gVGhyZWFkIDIgcmVj
ZWl2ZWQgc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KPiA+IFtTd2l0Y2hpbmcg
dG8gVGhyZWFkIDFdCj4gPiBfb3V0YiAoYWRkcj08b3B0aW1pemVkIG91dD4sIHZhbHVlPTxvcHRp
bWl6ZWQgb3V0PikgYXQgLi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmg6NTg0Cj4gPiA1ODQgICAg
ICAgICAgICAgX19yYXdfd3JpdGViKHZhbHVlLCBQQ0lfSU9CQVNFICsgYWRkcik7Cj4gPiAoZ2Ri
KSBidAo+ID4KPiA+IFRoaXMgc2VjdGlvbiBvZiB0aGUgY29kZSBpcyB0b28gZWFybHkgYmVjYXVz
ZSBpbiB0aGlzIGNhc2UKPiA+IHRoZSBvbWFwIHNlcmlhbCBpcyBub3QgcHJvYmVkCj4gPgo+ID4g
VGhyZWFkIDIgcmVjZWl2ZWQgc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KPiA+
IFtTd2l0Y2hpbmcgdG8gVGhyZWFkIDFdCj4gPiBfb3V0YiAoYWRkcj08b3B0aW1pemVkIG91dD4s
IHZhbHVlPTxvcHRpbWl6ZWQgb3V0PikgYXQgLi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmg6NTg0
Cj4gPiA1ODQgICAgICAgICAgICAgX19yYXdfd3JpdGViKHZhbHVlLCBQQ0lfSU9CQVNFICsgYWRk
cik7Cj4gPiAoZ2RiKSBidAo+ID4KPiA+IFRocmVhZCAyIHJlY2VpdmVkIHNpZ25hbCBTSUdTRUdW
LCBTZWdtZW50YXRpb24gZmF1bHQuCj4gPiBbU3dpdGNoaW5nIHRvIFRocmVhZCAxXQo+ID4gX291
dGIgKGFkZHI9PG9wdGltaXplZCBvdXQ+LCB2YWx1ZT08b3B0aW1pemVkIG91dD4pIGF0IC4vaW5j
bHVkZS9hc20tZ2VuZXJpYy9pby5oOjU4NAo+ID4gNTg0ICAgICAgICAgICAgIF9fcmF3X3dyaXRl
Yih2YWx1ZSwgUENJX0lPQkFTRSArIGFkZHIpOwo+ID4gKGdkYikgYnQKPiA+IDAgIF9vdXRiIChh
ZGRyPTxvcHRpbWl6ZWQgb3V0PiwgdmFsdWU9PG9wdGltaXplZCBvdXQ+KSBhdCAuL2luY2x1ZGUv
YXNtLWdlbmVyaWMvaW8uaDo1ODQKPiA+IDEgIGxvZ2ljX291dGIgKHZhbHVlPTAgJ1wwMDAnLCBh
ZGRyPTE4NDQ2NzM5Njc1NjM3ODc0Njg5KSBhdCBsaWIvbG9naWNfcGlvLmM6Mjk5Cj4gPiAyICAw
eGZmZmY4MDAwODA4MmRmY2MgaW4gaW9fc2VyaWFsX291dCAocD0weDAsIG9mZnNldD0xNjc2MDgz
MCwgdmFsdWU9MCkgYXQgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmM6NDE2Cj4g
PiAzICAweGZmZmY4MDAwODA4MmZlMzQgaW4gc2VyaWFsX3BvcnRfb3V0ICh2YWx1ZT08b3B0aW1p
emVkIG91dD4sIG9mZnNldD08b3B0aW1pemVkIG91dD4sIHVwPTxvcHRpbWl6ZWQgb3V0PikKPiA+
ICAgICBhdCAuL2luY2x1ZGUvbGludXgvc2VyaWFsX2NvcmUuaDo2NzcKPiA+IDQgIHNlcmlhbDgy
NTBfZG9fc2V0X3Rlcm1pb3MgKHBvcnQ9MHhmZmZmODAwMDgyOGVlOTQwIDxzZXJpYWw4MjUwX3Bv
cnRzKzE1Njg+LCB0ZXJtaW9zPTB4ZmZmZjgwMDA4MjkyYjkzYywgb2xkPTB4MCkKPiA+ICAgICBh
dCBkcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX3BvcnQuYzoyODYwCj4gPiA1ICAweGZmZmY4
MDAwODA4MzAwNjQgaW4gc2VyaWFsODI1MF9zZXRfdGVybWlvcyAocG9ydD0weGZmZmZmYmZmZmU4
MDAwMDAsIHRlcm1pb3M9MHhmZmJmZmUsIG9sZD0weDApCj4gPiAgICAgYXQgZHJpdmVycy90dHkv
c2VyaWFsLzgyNTAvODI1MF9wb3J0LmM6MjkxMgo+ID4gNiAgMHhmZmZmODAwMDgwODI1NzFjIGlu
IHVhcnRfc2V0X29wdGlvbnMgKHBvcnQ9MHhmZmZmODAwMDgyOGVlOTQwIDxzZXJpYWw4MjUwX3Bv
cnRzKzE1Njg+LCBjbz0weDAsIGJhdWQ9MTE1MjAwLCBwYXJpdHk9MTEwLCBiaXRzPTgsIGZsb3c9
MTEwKQo+ID4gICAgIGF0IGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jOjIyODUKPiA+
IDcgIDB4ZmZmZjgwMDA4MDgyODQzNCBpbiB1YXJ0X3BvbGxfaW5pdCAoZHJpdmVyPTB4ZmZmZmZi
ZmZmZTgwMDAwMCwgbGluZT0xNjc2MDgzMCwgb3B0aW9ucz0weGZmZmY4MDAwODI4Zjc1MDYgPGNv
bmZpZys2PiAiMTE1MjAwbjgiKQo+ID4gICAgIGF0IGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxf
Y29yZS5jOjI2NTYKPiA+IDggIDB4ZmZmZjgwMDA4MDgwMTY5MCBpbiB0dHlfZmluZF9wb2xsaW5n
X2RyaXZlciAobmFtZT0weGZmZmY4MDAwODI4Zjc1MDAgPGNvbmZpZz4gInR0eVMyLDExNTIwMG44
IiwgbGluZT0weGZmZmY4MDAwODI5MmJhOTApCj4gPiAgICAgYXQgZHJpdmVycy90dHkvdHR5X2lv
LmM6NDEwCj4gPiA5ICAweGZmZmY4MDAwODA4NmMwYjAgaW4gY29uZmlndXJlX2tnZGJvYyAoKSBh
dCBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmM6MTk0Cj4gPiAxMCAweGZmZmY4MDAwODA4NmMx
ZWMgaW4ga2dkYm9jX3Byb2JlIChwZGV2PTB4ZmZmZmZiZmZmZTgwMDAwMCkgYXQgZHJpdmVycy90
dHkvc2VyaWFsL2tnZGJvYy5jOjI0OQo+ID4gMTEgMHhmZmZmODAwMDgwOGIzOTljIGluIHBsYXRm
b3JtX3Byb2JlIChfZGV2PTB4ZmZmZjAwMDAwMGViYjgxMCkgYXQgZHJpdmVycy9iYXNlL3BsYXRm
b3JtLmM6MTQwNAo+ID4gMTIgMHhmZmZmODAwMDgwOGIwYjQ0IGluIGNhbGxfZHJpdmVyX3Byb2Jl
IChkcnY9PG9wdGltaXplZCBvdXQ+LCBkZXY9PG9wdGltaXplZCBvdXQ+KSBhdCBkcml2ZXJzL2Jh
c2UvZGQuYzo1NzkKPiA+IDEzIHJlYWxseV9wcm9iZSAoZGV2PTB4ZmZmZjAwMDAwMGViYjgxMCwg
ZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEzOCA8a2dkYm9jX3BsYXRmb3JtX2RyaXZlcis0OD4pIGF0IGRy
aXZlcnMvYmFzZS9kZC5jOjY1OAo+ID4gMTQgMHhmZmZmODAwMDgwOGIwZDJjIGluIF9fZHJpdmVy
X3Byb2JlX2RldmljZSAoZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEzOCA8a2dkYm9jX3BsYXRmb3JtX2Ry
aXZlcis0OD4sIGRldj0weGZmZmYwMDAwMDBlYmI4MTApCj4gPiAgICAgYXQgZHJpdmVycy9iYXNl
L2RkLmM6ODAwCj4gPiAxNSAweGZmZmY4MDAwODA4YjBlYjggaW4gZHJpdmVyX3Byb2JlX2Rldmlj
ZSAoZHJ2PTB4ZmZmZmZiZmZmZTgwMDAwMCwgZGV2PTB4ZmZmZjAwMDAwMGViYjgxMCkgYXQgZHJp
dmVycy9iYXNlL2RkLmM6ODMwCj4gPiAxNiAweGZmZmY4MDAwODA4YjBmZjQgaW4gX19kZXZpY2Vf
YXR0YWNoX2RyaXZlciAoZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEzOCA8a2dkYm9jX3BsYXRmb3JtX2Ry
aXZlcis0OD4sIF9kYXRhPTB4ZmZmZjgwMDA4MjkyYmM0OCkKPiA+ICAgICBhdCBkcml2ZXJzL2Jh
c2UvZGQuYzo5NTgKPiA+IDE3IDB4ZmZmZjgwMDA4MDhhZTk3MCBpbiBidXNfZm9yX2VhY2hfZHJ2
IChidXM9MHhmZmZmZmJmZmZlODAwMDAwLCBzdGFydD0weDAsIGRhdGE9MHhmZmZmODAwMDgyOTJi
YzQ4LAo+ID4gICAgIGZuPTB4ZmZmZjgwMDA4MDhiMGYzYyA8X19kZXZpY2VfYXR0YWNoX2RyaXZl
cj4pIGF0IGRyaXZlcnMvYmFzZS9idXMuYzo0NTcKPiA+IDE4IDB4ZmZmZjgwMDA4MDhiMTQwOCBp
biBfX2RldmljZV9hdHRhY2ggKGRldj0weGZmZmYwMDAwMDBlYmI4MTAsIGFsbG93X2FzeW5jPXRy
dWUpIGF0IGRyaXZlcnMvYmFzZS9kZC5jOjEwMzAKPiA+IDE5IDB4ZmZmZjgwMDA4MDhiMTZkOCBp
biBkZXZpY2VfaW5pdGlhbF9wcm9iZSAoZGV2PTB4ZmZmZmZiZmZmZTgwMDAwMCkgYXQgZHJpdmVy
cy9iYXNlL2RkLmM6MTA3OQo+ID4gMjAgMHhmZmZmODAwMDgwOGFmOWY0IGluIGJ1c19wcm9iZV9k
ZXZpY2UgKGRldj0weGZmZmYwMDAwMDBlYmI4MTApIGF0IGRyaXZlcnMvYmFzZS9idXMuYzo1MzIK
PiA+IDIxIDB4ZmZmZjgwMDA4MDhhYzc3YyBpbiBkZXZpY2VfYWRkIChkZXY9MHhmZmZmZmJmZmZl
ODAwMDAwKSBhdCBkcml2ZXJzL2Jhc2UvY29yZS5jOjM2MjUKPiA+IDIyIDB4ZmZmZjgwMDA4MDhi
MzQyOCBpbiBwbGF0Zm9ybV9kZXZpY2VfYWRkIChwZGV2PTB4ZmZmZjAwMDAwMGViYjgwMCkgYXQg
ZHJpdmVycy9iYXNlL3BsYXRmb3JtLmM6NzE2Cj4gPiAyMyAweGZmZmY4MDAwODFiNWRjMGMgaW4g
aW5pdF9rZ2Rib2MgKCkgYXQgZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jOjI5Mgo+ID4gMjQg
MHhmZmZmODAwMDgwMDE0ZGIwIGluIGRvX29uZV9pbml0Y2FsbCAoZm49MHhmZmZmODAwMDgxYjVk
YmE0IDxpbml0X2tnZGJvYz4pIGF0IGluaXQvbWFpbi5jOjEyMzYKPiA+IDI1IDB4ZmZmZjgwMDA4
MWIwMTE0YyBpbiBkb19pbml0Y2FsbF9sZXZlbCAoY29tbWFuZF9saW5lPTxvcHRpbWl6ZWQgb3V0
PiwgbGV2ZWw9PG9wdGltaXplZCBvdXQ+KSBhdCBpbml0L21haW4uYzoxMjk4Cj4gPiAyNiBkb19p
bml0Y2FsbHMgKCkgYXQgaW5pdC9tYWluLmM6MTMxNAo+ID4gMjcgZG9fYmFzaWNfc2V0dXAgKCkg
YXQgaW5pdC9tYWluLmM6MTMzMwo+ID4gMjgga2VybmVsX2luaXRfZnJlZWFibGUgKCkgYXQgaW5p
dC9tYWluLmM6MTU1MQo+ID4gMjkgMHhmZmZmODAwMDgxMDI3MWVjIGluIGtlcm5lbF9pbml0ICh1
bnVzZWQ9MHhmZmZmZmJmZmZlODAwMDAwKSBhdCBpbml0L21haW4uYzoxNDQxCj4gPiAzMCAweGZm
ZmY4MDAwODAwMTVlODAgaW4gcmV0X2Zyb21fZm9yayAoKSBhdCBhcmNoL2FybTY0L2tlcm5lbC9l
bnRyeS5TOjg1Nwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNo
YWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy90dHkvc2VyaWFs
L2tnZGJvYy5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9j
LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMKPiA+IGluZGV4IDdjZTdiYjE2NDAwNS4u
N2Y4MzY0NTA3ZjU1IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5j
Cj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMKPiA+IEBAIC02MjIsNyArNjIy
LDcgQEAgY29uc29sZV9pbml0Y2FsbChrZ2Rib2NfZWFybHljb25fbGF0ZV9pbml0KTsKPiA+Cj4g
PiAgI2VuZGlmIC8qIElTX0JVSUxUSU4oQ09ORklHX0tHREJfU0VSSUFMX0NPTlNPTEUpICovCj4g
Pgo+ID4gLW1vZHVsZV9pbml0KGluaXRfa2dkYm9jKTsKPiA+ICtsYXRlX2luaXRjYWxsX3N5bmMo
aW5pdF9rZ2Rib2MpOwo+Cj4gV2hpbGUgSSdtIG5vdCBkZW55aW5nIHRoYXQgeW91IGhpdCBhIGJ1
ZywgSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZQo+IGNvcnJlY3QgZml4LiBUaGUgd2F5IGl0J3Mg
c3VwcG9zZWQgdG8gd29yayBpczoKPgoKWWVzIGl0J3MgYSBidWcKCj4gMS4gaW5pdF9rZ2Rib2Mo
KSBydW5zIGFuZCByZWdpc3RlcnMgdGhlIHNpbmdsZXRvbiBrZ2RiICJwbGF0Zm9ybSBkcml2ZXIi
Lgo+Cj4gMi4gVGhlIHBsYXRmb3JtIGRyaXZlcidzIHByb2JlIGZ1bmN0aW9uLCBrZ2Rib2NfcHJv
YmUoKSwgcnVucyBhbmQKPiBjaGVja3MgdG8gc2VlIGlmIHRoZSBjb25zb2xlIGlzIHJlYWR5IGJ5
IGxvb2tpbmcgYXQgdGhlIHJldHVybiB2YWx1ZQo+IG9mIGNvbmZpZ3VyZV9rZ2Rib2MoKS4gSWYg
aXQncyByZWFkeSB0aGVuIHdlJ3JlIGdvb2QgdG8gZ28uIElmIGl0J3MKPiBub3QgcmVhZHkgdGhl
biB3ZSBkZWZlci4KPgo+IFNvIEkgdGhpbmsgdGhlIGJ1ZyBoZXJlIGlzIHRoYXQgc29tZWhvdyB0
aGUgY29uc29sZSBsb29rcyAicmVhZHkiCj4gKGJlY2F1c2UgdHR5X2ZpbmRfcG9sbGluZ19kcml2
ZXIoKSBjYW4gZmluZCBpdCkgYnV0IGl0IGlzbid0IGFjdHVhbGx5Cj4gcmVhZHkgeWV0IChiZWNh
dXNlIGl0IGNyYXNoZXMpLiBUaGF0J3Mgd2hhdCB5b3UgbmVlZCB0byBmaXguCj4KClRoZSBwb2xs
aW5nIGRyaXZlciBsb29rIGZvciB1YXJ0IGFuZCB1YXJ0ODI1MF9jb3JlIGlzIHJlZ2lzdGVyZWQg
YW5kIDQgZmFrZSB1YXJ0CmFyZSB0aGVyZSBidXQgdGhlcmUgYXJlIG5vdCBzdGlsbCByZXBsYWNl
ZCBieSBwbGF0Zm9ybSBkcml2ZXIgdGhhdCBjYW4KY29tZSBsYXRlci4KVGhlIHRyeV9wb2xsaW5n
IGZpbmQgaXQgYnV0IGl0J3MgdGhlIGlzYS04MjUwIGRyaXZlci4gSXQgbWVhbnMgdGhhdAphZGRf
dWFydCA4MjUwIGlzCm5vdCBzdGlsbCBoYXBwZW4KCj4gSSdsbCBub3RlIHRoYXQsIGluIHRoZSBw
YXN0LCBJJ3ZlIGRlZmluaXRlbHkgdXNlZCBrZ2RiIG9uIDgyNTAtYmFzZWQKPiBVQVJUcy4gSXMg
eW91ciBoYXJkd2FyZSBzb21laG93IHNwZWNpYWwgb3IgaXMgdGhpcyBhIHJlZ3Jlc3Npb24/Cj4K
Ck1pY2hhZWwKCj4gLURvdWcKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1G
b3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNo
YWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFt
c3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5j
b20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
