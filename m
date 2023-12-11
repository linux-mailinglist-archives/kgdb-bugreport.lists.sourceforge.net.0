Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079E80DE63
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Dec 2023 23:40:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rCows-0000F2-Qe
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 11 Dec 2023 22:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rCows-0000Ew-7z
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SySyhdl+LwK97eXIEdoblEzUW4l78p2e3ZeB9Nc8urE=; b=TWr2SW9Wq6edsP4huREyaqTdbW
 dD1BGif18UvWj88fTQXqhknTgkdhz5flBBFC3MAyYuoGHH0jATZA6CLyrdOebU36RlqqpHklI8kkK
 Wt6FH/ZOAHVmF+gcD2qiL0liGzCIxmbO0rvSYdjJ6msK3sdYKgykLqF/wRUVPtUXU2uM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SySyhdl+LwK97eXIEdoblEzUW4l78p2e3ZeB9Nc8urE=; b=ZQjQyf+xpPxSOQ6dmny5GU2CB9
 v8wekHpCQcsghArAYTa5ITzIUjkWwRBDv4SSR9UX7jwk172SYpu7+0LWYlGALFZcfckEZJcUi6XmM
 G0HuDEvGA+ta9f3xEsGiOzLMJwQWJuchRll4uY+7yWdH/o85wxnBm1u2nORTJhO7k8j0=;
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rCowq-0007jU-EN for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:40:25 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40c0fc1cf3dso52544395e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Dec 2023 14:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702334413; x=1702939213;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SySyhdl+LwK97eXIEdoblEzUW4l78p2e3ZeB9Nc8urE=;
 b=jxASOkbSEYUtOEgdmb/0hUziZw8okpvkkEqz03qNaENb+N6QQFpKvhgWr0qumITyJD
 cWaankWy1A5izDv8V+lb6+9rdgo9JEOlZlrPiKGPaMW26Ek+vLxYoh+1RLiA5vfcb9KR
 /AtfVnhaqerwhyRU26RVB0koxZG8gX+tLTU4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702334413; x=1702939213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SySyhdl+LwK97eXIEdoblEzUW4l78p2e3ZeB9Nc8urE=;
 b=So02Ozhn8ZXOW4eZSomO/out9/tl1mA8ztN7op6Qn58l08mflP44tn241sgx95VF5s
 S22dLbm6ew15l+0J4BZqsrOPkQMiLgQqABFsXWp+hCSc6YI5mNx/Zja4de6/S8xdNoSL
 N/mXblxtCJFpO9F/loJLK7QosxF427TppWi8ac9Xj/+7TBh95eE7XMlg9uSksPt2re68
 1V17o9CsKKaWiHUMYxR4spCITEbLDTW7rDTm0YwndC14cRdMHoQAqa2Y+HGL4WH2Zcn8
 bOjX/nPIpPBCZdFoNCIBD2htR0dfAoqg8rfwtKuVC0cct8sf7MKgqQSNwd7B/B1fHSjT
 yW5Q==
X-Gm-Message-State: AOJu0YznADX5JbltOTQsMgYBdWVP307icxB1n0CUUfAVrI+Av1jIL4AU
 2fOo0gRsPKLI1Ysgb82Qdb9GGtQX5SWScXVEeZT2nNtr
X-Google-Smtp-Source: AGHT+IFgEKwT6nGyruMnHDn77dpUSgtXcYIlGNuiaCtY9/B/FP74mA29ivmdMwZGgJlHgcDb6HkZXw==
X-Received: by 2002:a17:906:3c57:b0:a19:a19b:78b7 with SMTP id
 i23-20020a1709063c5700b00a19a19b78b7mr2297229ejg.122.1702330750123; 
 Mon, 11 Dec 2023 13:39:10 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 d11-20020a170907272b00b00a1e2aa3d094sm5439700ejl.173.2023.12.11.13.39.09
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 13:39:10 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40c3963f9fcso4195e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Dec 2023 13:39:09 -0800 (PST)
X-Received: by 2002:a05:600c:1e27:b0:40b:5972:f56b with SMTP id
 ay39-20020a05600c1e2700b0040b5972f56bmr252603wmb.3.1702330749230; Mon, 11 Dec
 2023 13:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
In-Reply-To: <20231208212845.1679621-1-michael@amarulasolutions.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Dec 2023 13:38:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
Message-ID: <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Dec 8, 2023 at 1:28 PM Michael Trimarchi <michael@amarulasolutions.com>
    wrote: > > Use late_initcall_sync insted of module init to be sure that >
    serial driver is really probed and get take [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCowq-0007jU-EN
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

SGksCgpPbiBGcmksIERlYyA4LCAyMDIzIGF0IDE6MjjigK9QTSBNaWNoYWVsIFRyaW1hcmNoaQo8
bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiBVc2UgbGF0ZV9pbml0Y2Fs
bF9zeW5jIGluc3RlZCBvZiBtb2R1bGUgaW5pdCB0byBiZSBzdXJlIHRoYXQKPiBzZXJpYWwgZHJp
dmVyIGlzIHJlYWxseSBwcm9iZWQgYW5kIGdldCB0YWtlIGhhbmRvdmVyIGZyb20KPiBlYXJseSBk
cml2ZXIuCgpBd2Vzb21lIHRoYXQgeW91IHVzZWQgdGhlIGVhcmx5Y29uIGRyaXZlciB0byBkZWJ1
ZyBwcm9ibGVtcyB3aXRoCnJlZ2lzdGVyaW5nIHRoZSBub3JtYWwgZHJpdmVyISA6LVAKCgo+IFRo
ZSA4MjUwIHJlZ2lzdGVyIHRoZSBwbGF0Zm9ybSBkcml2ZXIgYWZ0ZXIKPiB0aGUgODI1MCBjb3Jl
IGlzIGluaXRpYWxpemVkLiBBcyBzaG93biBieSBrZGJnCj4KPiBUaHJlYWQgMiByZWNlaXZlZCBz
aWduYWwgU0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0Lgo+IFtTd2l0Y2hpbmcgdG8gVGhyZWFk
IDFdCj4gX291dGIgKGFkZHI9PG9wdGltaXplZCBvdXQ+LCB2YWx1ZT08b3B0aW1pemVkIG91dD4p
IGF0IC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oOjU4NAo+IDU4NCAgICAgICAgICAgICBfX3Jh
d193cml0ZWIodmFsdWUsIFBDSV9JT0JBU0UgKyBhZGRyKTsKPiAoZ2RiKSBidAo+Cj4gVGhpcyBz
ZWN0aW9uIG9mIHRoZSBjb2RlIGlzIHRvbyBlYXJseSBiZWNhdXNlIGluIHRoaXMgY2FzZQo+IHRo
ZSBvbWFwIHNlcmlhbCBpcyBub3QgcHJvYmVkCj4KPiBUaHJlYWQgMiByZWNlaXZlZCBzaWduYWwg
U0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0Lgo+IFtTd2l0Y2hpbmcgdG8gVGhyZWFkIDFdCj4g
X291dGIgKGFkZHI9PG9wdGltaXplZCBvdXQ+LCB2YWx1ZT08b3B0aW1pemVkIG91dD4pIGF0IC4v
aW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oOjU4NAo+IDU4NCAgICAgICAgICAgICBfX3Jhd193cml0
ZWIodmFsdWUsIFBDSV9JT0JBU0UgKyBhZGRyKTsKPiAoZ2RiKSBidAo+Cj4gVGhyZWFkIDIgcmVj
ZWl2ZWQgc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KPiBbU3dpdGNoaW5nIHRv
IFRocmVhZCAxXQo+IF9vdXRiIChhZGRyPTxvcHRpbWl6ZWQgb3V0PiwgdmFsdWU9PG9wdGltaXpl
ZCBvdXQ+KSBhdCAuL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaDo1ODQKPiA1ODQgICAgICAgICAg
ICAgX19yYXdfd3JpdGViKHZhbHVlLCBQQ0lfSU9CQVNFICsgYWRkcik7Cj4gKGdkYikgYnQKPiAw
ICBfb3V0YiAoYWRkcj08b3B0aW1pemVkIG91dD4sIHZhbHVlPTxvcHRpbWl6ZWQgb3V0PikgYXQg
Li9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmg6NTg0Cj4gMSAgbG9naWNfb3V0YiAodmFsdWU9MCAn
XDAwMCcsIGFkZHI9MTg0NDY3Mzk2NzU2Mzc4NzQ2ODkpIGF0IGxpYi9sb2dpY19waW8uYzoyOTkK
PiAyICAweGZmZmY4MDAwODA4MmRmY2MgaW4gaW9fc2VyaWFsX291dCAocD0weDAsIG9mZnNldD0x
Njc2MDgzMCwgdmFsdWU9MCkgYXQgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmM6
NDE2Cj4gMyAgMHhmZmZmODAwMDgwODJmZTM0IGluIHNlcmlhbF9wb3J0X291dCAodmFsdWU9PG9w
dGltaXplZCBvdXQ+LCBvZmZzZXQ9PG9wdGltaXplZCBvdXQ+LCB1cD08b3B0aW1pemVkIG91dD4p
Cj4gICAgIGF0IC4vaW5jbHVkZS9saW51eC9zZXJpYWxfY29yZS5oOjY3Nwo+IDQgIHNlcmlhbDgy
NTBfZG9fc2V0X3Rlcm1pb3MgKHBvcnQ9MHhmZmZmODAwMDgyOGVlOTQwIDxzZXJpYWw4MjUwX3Bv
cnRzKzE1Njg+LCB0ZXJtaW9zPTB4ZmZmZjgwMDA4MjkyYjkzYywgb2xkPTB4MCkKPiAgICAgYXQg
ZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmM6Mjg2MAo+IDUgIDB4ZmZmZjgwMDA4
MDgzMDA2NCBpbiBzZXJpYWw4MjUwX3NldF90ZXJtaW9zIChwb3J0PTB4ZmZmZmZiZmZmZTgwMDAw
MCwgdGVybWlvcz0weGZmYmZmZSwgb2xkPTB4MCkKPiAgICAgYXQgZHJpdmVycy90dHkvc2VyaWFs
LzgyNTAvODI1MF9wb3J0LmM6MjkxMgo+IDYgIDB4ZmZmZjgwMDA4MDgyNTcxYyBpbiB1YXJ0X3Nl
dF9vcHRpb25zIChwb3J0PTB4ZmZmZjgwMDA4MjhlZTk0MCA8c2VyaWFsODI1MF9wb3J0cysxNTY4
PiwgY289MHgwLCBiYXVkPTExNTIwMCwgcGFyaXR5PTExMCwgYml0cz04LCBmbG93PTExMCkKPiAg
ICAgYXQgZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmM6MjI4NQo+IDcgIDB4ZmZmZjgw
MDA4MDgyODQzNCBpbiB1YXJ0X3BvbGxfaW5pdCAoZHJpdmVyPTB4ZmZmZmZiZmZmZTgwMDAwMCwg
bGluZT0xNjc2MDgzMCwgb3B0aW9ucz0weGZmZmY4MDAwODI4Zjc1MDYgPGNvbmZpZys2PiAiMTE1
MjAwbjgiKQo+ICAgICBhdCBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYzoyNjU2Cj4g
OCAgMHhmZmZmODAwMDgwODAxNjkwIGluIHR0eV9maW5kX3BvbGxpbmdfZHJpdmVyIChuYW1lPTB4
ZmZmZjgwMDA4MjhmNzUwMCA8Y29uZmlnPiAidHR5UzIsMTE1MjAwbjgiLCBsaW5lPTB4ZmZmZjgw
MDA4MjkyYmE5MCkKPiAgICAgYXQgZHJpdmVycy90dHkvdHR5X2lvLmM6NDEwCj4gOSAgMHhmZmZm
ODAwMDgwODZjMGIwIGluIGNvbmZpZ3VyZV9rZ2Rib2MgKCkgYXQgZHJpdmVycy90dHkvc2VyaWFs
L2tnZGJvYy5jOjE5NAo+IDEwIDB4ZmZmZjgwMDA4MDg2YzFlYyBpbiBrZ2Rib2NfcHJvYmUgKHBk
ZXY9MHhmZmZmZmJmZmZlODAwMDAwKSBhdCBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmM6MjQ5
Cj4gMTEgMHhmZmZmODAwMDgwOGIzOTljIGluIHBsYXRmb3JtX3Byb2JlIChfZGV2PTB4ZmZmZjAw
MDAwMGViYjgxMCkgYXQgZHJpdmVycy9iYXNlL3BsYXRmb3JtLmM6MTQwNAo+IDEyIDB4ZmZmZjgw
MDA4MDhiMGI0NCBpbiBjYWxsX2RyaXZlcl9wcm9iZSAoZHJ2PTxvcHRpbWl6ZWQgb3V0PiwgZGV2
PTxvcHRpbWl6ZWQgb3V0PikgYXQgZHJpdmVycy9iYXNlL2RkLmM6NTc5Cj4gMTMgcmVhbGx5X3By
b2JlIChkZXY9MHhmZmZmMDAwMDAwZWJiODEwLCBkcnY9MHhmZmZmODAwMDgyNzdmMTM4IDxrZ2Ri
b2NfcGxhdGZvcm1fZHJpdmVyKzQ4PikgYXQgZHJpdmVycy9iYXNlL2RkLmM6NjU4Cj4gMTQgMHhm
ZmZmODAwMDgwOGIwZDJjIGluIF9fZHJpdmVyX3Byb2JlX2RldmljZSAoZHJ2PTB4ZmZmZjgwMDA4
Mjc3ZjEzOCA8a2dkYm9jX3BsYXRmb3JtX2RyaXZlcis0OD4sIGRldj0weGZmZmYwMDAwMDBlYmI4
MTApCj4gICAgIGF0IGRyaXZlcnMvYmFzZS9kZC5jOjgwMAo+IDE1IDB4ZmZmZjgwMDA4MDhiMGVi
OCBpbiBkcml2ZXJfcHJvYmVfZGV2aWNlIChkcnY9MHhmZmZmZmJmZmZlODAwMDAwLCBkZXY9MHhm
ZmZmMDAwMDAwZWJiODEwKSBhdCBkcml2ZXJzL2Jhc2UvZGQuYzo4MzAKPiAxNiAweGZmZmY4MDAw
ODA4YjBmZjQgaW4gX19kZXZpY2VfYXR0YWNoX2RyaXZlciAoZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEz
OCA8a2dkYm9jX3BsYXRmb3JtX2RyaXZlcis0OD4sIF9kYXRhPTB4ZmZmZjgwMDA4MjkyYmM0OCkK
PiAgICAgYXQgZHJpdmVycy9iYXNlL2RkLmM6OTU4Cj4gMTcgMHhmZmZmODAwMDgwOGFlOTcwIGlu
IGJ1c19mb3JfZWFjaF9kcnYgKGJ1cz0weGZmZmZmYmZmZmU4MDAwMDAsIHN0YXJ0PTB4MCwgZGF0
YT0weGZmZmY4MDAwODI5MmJjNDgsCj4gICAgIGZuPTB4ZmZmZjgwMDA4MDhiMGYzYyA8X19kZXZp
Y2VfYXR0YWNoX2RyaXZlcj4pIGF0IGRyaXZlcnMvYmFzZS9idXMuYzo0NTcKPiAxOCAweGZmZmY4
MDAwODA4YjE0MDggaW4gX19kZXZpY2VfYXR0YWNoIChkZXY9MHhmZmZmMDAwMDAwZWJiODEwLCBh
bGxvd19hc3luYz10cnVlKSBhdCBkcml2ZXJzL2Jhc2UvZGQuYzoxMDMwCj4gMTkgMHhmZmZmODAw
MDgwOGIxNmQ4IGluIGRldmljZV9pbml0aWFsX3Byb2JlIChkZXY9MHhmZmZmZmJmZmZlODAwMDAw
KSBhdCBkcml2ZXJzL2Jhc2UvZGQuYzoxMDc5Cj4gMjAgMHhmZmZmODAwMDgwOGFmOWY0IGluIGJ1
c19wcm9iZV9kZXZpY2UgKGRldj0weGZmZmYwMDAwMDBlYmI4MTApIGF0IGRyaXZlcnMvYmFzZS9i
dXMuYzo1MzIKPiAyMSAweGZmZmY4MDAwODA4YWM3N2MgaW4gZGV2aWNlX2FkZCAoZGV2PTB4ZmZm
ZmZiZmZmZTgwMDAwMCkgYXQgZHJpdmVycy9iYXNlL2NvcmUuYzozNjI1Cj4gMjIgMHhmZmZmODAw
MDgwOGIzNDI4IGluIHBsYXRmb3JtX2RldmljZV9hZGQgKHBkZXY9MHhmZmZmMDAwMDAwZWJiODAw
KSBhdCBkcml2ZXJzL2Jhc2UvcGxhdGZvcm0uYzo3MTYKPiAyMyAweGZmZmY4MDAwODFiNWRjMGMg
aW4gaW5pdF9rZ2Rib2MgKCkgYXQgZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jOjI5Mgo+IDI0
IDB4ZmZmZjgwMDA4MDAxNGRiMCBpbiBkb19vbmVfaW5pdGNhbGwgKGZuPTB4ZmZmZjgwMDA4MWI1
ZGJhNCA8aW5pdF9rZ2Rib2M+KSBhdCBpbml0L21haW4uYzoxMjM2Cj4gMjUgMHhmZmZmODAwMDgx
YjAxMTRjIGluIGRvX2luaXRjYWxsX2xldmVsIChjb21tYW5kX2xpbmU9PG9wdGltaXplZCBvdXQ+
LCBsZXZlbD08b3B0aW1pemVkIG91dD4pIGF0IGluaXQvbWFpbi5jOjEyOTgKPiAyNiBkb19pbml0
Y2FsbHMgKCkgYXQgaW5pdC9tYWluLmM6MTMxNAo+IDI3IGRvX2Jhc2ljX3NldHVwICgpIGF0IGlu
aXQvbWFpbi5jOjEzMzMKPiAyOCBrZXJuZWxfaW5pdF9mcmVlYWJsZSAoKSBhdCBpbml0L21haW4u
YzoxNTUxCj4gMjkgMHhmZmZmODAwMDgxMDI3MWVjIGluIGtlcm5lbF9pbml0ICh1bnVzZWQ9MHhm
ZmZmZmJmZmZlODAwMDAwKSBhdCBpbml0L21haW4uYzoxNDQxCj4gMzAgMHhmZmZmODAwMDgwMDE1
ZTgwIGluIHJldF9mcm9tX2ZvcmsgKCkgYXQgYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUzo4NTcK
Pgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmMgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9r
Z2Rib2MuYwo+IGluZGV4IDdjZTdiYjE2NDAwNS4uN2Y4MzY0NTA3ZjU1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdHR5L3NlcmlhbC9rZ2Rib2MuYwo+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9r
Z2Rib2MuYwo+IEBAIC02MjIsNyArNjIyLDcgQEAgY29uc29sZV9pbml0Y2FsbChrZ2Rib2NfZWFy
bHljb25fbGF0ZV9pbml0KTsKPgo+ICAjZW5kaWYgLyogSVNfQlVJTFRJTihDT05GSUdfS0dEQl9T
RVJJQUxfQ09OU09MRSkgKi8KPgo+IC1tb2R1bGVfaW5pdChpbml0X2tnZGJvYyk7Cj4gK2xhdGVf
aW5pdGNhbGxfc3luYyhpbml0X2tnZGJvYyk7CgpXaGlsZSBJJ20gbm90IGRlbnlpbmcgdGhhdCB5
b3UgaGl0IGEgYnVnLCBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdGhlCmNvcnJlY3QgZml4LiBUaGUg
d2F5IGl0J3Mgc3VwcG9zZWQgdG8gd29yayBpczoKCjEuIGluaXRfa2dkYm9jKCkgcnVucyBhbmQg
cmVnaXN0ZXJzIHRoZSBzaW5nbGV0b24ga2dkYiAicGxhdGZvcm0gZHJpdmVyIi4KCjIuIFRoZSBw
bGF0Zm9ybSBkcml2ZXIncyBwcm9iZSBmdW5jdGlvbiwga2dkYm9jX3Byb2JlKCksIHJ1bnMgYW5k
CmNoZWNrcyB0byBzZWUgaWYgdGhlIGNvbnNvbGUgaXMgcmVhZHkgYnkgbG9va2luZyBhdCB0aGUg
cmV0dXJuIHZhbHVlCm9mIGNvbmZpZ3VyZV9rZ2Rib2MoKS4gSWYgaXQncyByZWFkeSB0aGVuIHdl
J3JlIGdvb2QgdG8gZ28uIElmIGl0J3MKbm90IHJlYWR5IHRoZW4gd2UgZGVmZXIuCgpTbyBJIHRo
aW5rIHRoZSBidWcgaGVyZSBpcyB0aGF0IHNvbWVob3cgdGhlIGNvbnNvbGUgbG9va3MgInJlYWR5
IgooYmVjYXVzZSB0dHlfZmluZF9wb2xsaW5nX2RyaXZlcigpIGNhbiBmaW5kIGl0KSBidXQgaXQg
aXNuJ3QgYWN0dWFsbHkKcmVhZHkgeWV0IChiZWNhdXNlIGl0IGNyYXNoZXMpLiBUaGF0J3Mgd2hh
dCB5b3UgbmVlZCB0byBmaXguCgpJJ2xsIG5vdGUgdGhhdCwgaW4gdGhlIHBhc3QsIEkndmUgZGVm
aW5pdGVseSB1c2VkIGtnZGIgb24gODI1MC1iYXNlZApVQVJUcy4gSXMgeW91ciBoYXJkd2FyZSBz
b21laG93IHNwZWNpYWwgb3IgaXMgdGhpcyBhIHJlZ3Jlc3Npb24/CgotRG91ZwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1h
aWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
