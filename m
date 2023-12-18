Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E4B817FFA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 19 Dec 2023 03:58:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rFQJn-0005z7-Bg
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 19 Dec 2023 02:58:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rFQJm-0005z1-CP
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 19 Dec 2023 02:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j775zdStwoFQYQMkXt4HFx0DeDqilzNZA8Ur98U7dD0=; b=l0fB274aq3w4IKfp+6VsYs0331
 hM9frumM1x7ZBHtE9rmg+wF4+H+HnMb/MgJtr5UdeDUPn6oY2uK9NAwkJU1DAlu925Kc5Dz2niNJ0
 nW7OZC8CZTEs8oVZYxrlIME9WzLivirEU0VMe2FWYcs4qFsnxKv0l9O+T+Ao+PUKt9Vk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j775zdStwoFQYQMkXt4HFx0DeDqilzNZA8Ur98U7dD0=; b=cYJLlgPH1287XU5AJvidUx4hlS
 JhCkIXZAk8Jzipt4W0eAy1UQqZYvvXrJOVWVZm+3moHtIwI5yPWpCN/9sNg3BBYaGShbIs7rjA0dv
 vXEQyF3xZ6FiTsdGf9qvAaxNn4nyOmzKgAle7gJZhAe53euT/0LobEtRqds+EMwxuGo0=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rFQJl-0007n2-JR for kgdb-bugreport@lists.sourceforge.net;
 Tue, 19 Dec 2023 02:58:50 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-33666946422so1585431f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Dec 2023 18:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702954718; x=1703559518;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j775zdStwoFQYQMkXt4HFx0DeDqilzNZA8Ur98U7dD0=;
 b=NIoPd5c2G9xL8boVhU58yv5rQYX9HkZjsT/jNZOnLlo0jI40SfdyI9Pra3PV6bQaBN
 IvHaDc04a29mQGKgEd4fexq57k/1oSfTSbbtNM6yd+xwoUdAkC7XWdJ8bbVD3CWkf1Ku
 mwiAbmptQ+d79zehoY6tSYRvXx4c3Ez194Qus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702954718; x=1703559518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j775zdStwoFQYQMkXt4HFx0DeDqilzNZA8Ur98U7dD0=;
 b=VtM6SA3T9FfVhY7l7kfUXMRxdHZm8mQ8Z5JGry2u/LkY1rSJwwuSusqWfAbpKnIxKt
 kmX6F+ZwVxiTneNefoGVh948d/E33ks2jgY545+Dir7ZNRS/vJBRKwwIyc8kaaL6THl3
 mB5KTWk4OFJFlx7qD5CEN2HjqOYVbczEFBhHJvrS22+brB3217tdXdoCVMOvBYrOAPYb
 CL5vwjGfMD5cW4OHzP8/iiT4SrBMauZjB1OWb6fEQlD+oaurNrzRvbSv3mXatwDLUd0O
 RCFCj2ztDlohYf8vvChelaJanA2zt2ItrUitSr2QJw5IRsYhskgqehHSY73eMShcsUYk
 4mdg==
X-Gm-Message-State: AOJu0YzE8YSZ9xWrkVpfSYRsE9oiX3+F4vpwVuLIuwWv3fmO4aIbuaGl
 PuJqhGK7FgMrZnH6ElhwDMjjNcF25M9swgSESd5//6j8
X-Google-Smtp-Source: AGHT+IHi39tiRtPzx5kLt5yonLU+ouROMrFGYdefUKk0EQMmArCj++x9IJcbnqabRUAcWlsD5AKj4A==
X-Received: by 2002:a17:906:188:b0:a19:a1ba:da45 with SMTP id
 8-20020a170906018800b00a19a1bada45mr7125201ejb.108.1702938879477; 
 Mon, 18 Dec 2023 14:34:39 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 af2-20020a170906998200b00a2351e4c8e6sm2102702ejc.198.2023.12.18.14.34.38
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 14:34:39 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-548ae9a5eeaso1813a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Dec 2023 14:34:38 -0800 (PST)
X-Received: by 2002:a50:c307:0:b0:54c:9996:7833 with SMTP id
 a7-20020a50c307000000b0054c99967833mr22018edb.7.1702938878434; Mon, 18 Dec
 2023 14:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20231216173409.1264655-1-michael@amarulasolutions.com>
 <20231218073407.300982-1-michael@amarulasolutions.com>
In-Reply-To: <20231218073407.300982-1-michael@amarulasolutions.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 14:34:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VaDJSXt5kyfzZ=qv9ZHRNerHFs7izXZbgudvfcOThc_Q@mail.gmail.com>
Message-ID: <CAD=FV=VaDJSXt5kyfzZ=qv9ZHRNerHFs7izXZbgudvfcOThc_Q@mail.gmail.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, Dec 17, 2023 at 11:34 PM Michael Trimarchi <michael@amarulasolutions.com>
    wrote: > > Check if port type is not PORT_UNKNOWN during poll_init. > The
    kgdboc calls the tty_find_polling_driver t [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFQJl-0007n2-JR
Subject: Re: [Kgdb-bugreport] [PATCH V2] tty: serial: kgdboc: Fix 8250_* kgd
 over serial
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIERlYyAxNywgMjAyMyBhdCAxMTozNOKAr1BNIE1pY2hhZWwgVHJpbWFyY2hp
CjxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+IENoZWNrIGlmIHBvcnQg
dHlwZSBpcyBub3QgUE9SVF9VTktOT1dOIGR1cmluZyBwb2xsX2luaXQuCj4gVGhlIGtnZGJvYyBj
YWxscyB0aGUgdHR5X2ZpbmRfcG9sbGluZ19kcml2ZXIgdGhhdCBjaGVjawo+IGlmIHRoZSBzZXJp
YWwgaXMgYWJsZSB0byB1c2UgcG9sbF9pbml0LiBUaGUgcG9sbF9pbml0IGNhbGxzCj4gdGhlIHVh
cnQgdWFydF9wb2xsX2luaXQgdGhhdCB0cnkgdG8gY29uZmlndXJlIHRoZSB1YXJ0IHdpdGggdGhl
Cj4gc2VsZWN0ZWQgYm9vdCBwYXJhbWV0ZXJzLiBUaGUgdWFydCBtdXN0IGJlIHJlYWR5IGJlZm9y
ZSBzZXR0aW5nCj4gcGFyYW1ldGVycy4gU2VlbXMgdGhhdCBQT1JUX1VOS05PV04gaXMgYWxyZWFk
eSB1c2VkIGJ5IG90aGVyCj4gZnVuY3Rpb25zIGluIHNlcmlhbF9jb3JlIHRvIGRldGVjdCB1YXJ0
IHN0YXR1cywgc28gdXNlIHRoZSBzYW1lCj4gdG8gYXZvaWQgdG8gdXNlIGl0IGluIGludmFsaWQg
c3RhdGUuCj4KPiBUaGUgY3Jhc2ggaGFwcGVuIGZvciBpbnN0YW5jZSBpbiBhbTYyeCBhcmNoaXRl
Y3R1cmUgd2hlcmUgdGhlIDgyNTAKPiByZWdpc3RlciB0aGUgcGxhdGZvcm0gZHJpdmVyIGFmdGVy
IHRoZSA4MjUwIGNvcmUgaXMgaW5pdGlhbGl6ZWQuCj4KPiBGb2xsb3cgdGhlIHJlcG9ydCBjcmFz
aCBjb21pbmcgZnJvbSBLR0RCCj4KPiBUaHJlYWQgMiByZWNlaXZlZCBzaWduYWwgU0lHU0VHViwg
U2VnbWVudGF0aW9uIGZhdWx0Lgo+IFtTd2l0Y2hpbmcgdG8gVGhyZWFkIDFdCj4gX291dGIgKGFk
ZHI9PG9wdGltaXplZCBvdXQ+LCB2YWx1ZT08b3B0aW1pemVkIG91dD4pIGF0IC4vaW5jbHVkZS9h
c20tZ2VuZXJpYy9pby5oOjU4NAo+IDU4NCAgICAgICAgICAgICBfX3Jhd193cml0ZWIodmFsdWUs
IFBDSV9JT0JBU0UgKyBhZGRyKTsKPiAoZ2RiKSBidAo+Cj4gVGhpcyBzZWN0aW9uIG9mIHRoZSBj
b2RlIGlzIHRvbyBlYXJseSBiZWNhdXNlIGluIHRoaXMgY2FzZQo+IHRoZSBvbWFwIHNlcmlhbCBp
cyBub3QgcHJvYmVkCj4KPiBUaHJlYWQgMiByZWNlaXZlZCBzaWduYWwgU0lHU0VHViwgU2VnbWVu
dGF0aW9uIGZhdWx0Lgo+IFtTd2l0Y2hpbmcgdG8gVGhyZWFkIDFdCj4gX291dGIgKGFkZHI9PG9w
dGltaXplZCBvdXQ+LCB2YWx1ZT08b3B0aW1pemVkIG91dD4pIGF0IC4vaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9pby5oOjU4NAo+IDU4NCAgICAgICAgICAgICBfX3Jhd193cml0ZWIodmFsdWUsIFBDSV9J
T0JBU0UgKyBhZGRyKTsKPiAoZ2RiKSBidAo+Cj4gVGhyZWFkIDIgcmVjZWl2ZWQgc2lnbmFsIFNJ
R1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KPiBbU3dpdGNoaW5nIHRvIFRocmVhZCAxXQo+IF9v
dXRiIChhZGRyPTxvcHRpbWl6ZWQgb3V0PiwgdmFsdWU9PG9wdGltaXplZCBvdXQ+KSBhdCAuL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvaW8uaDo1ODQKPiA1ODQgICAgICAgICAgICAgX19yYXdfd3JpdGVi
KHZhbHVlLCBQQ0lfSU9CQVNFICsgYWRkcik7Cj4gKGdkYikgYnQKPiAwICBfb3V0YiAoYWRkcj08
b3B0aW1pemVkIG91dD4sIHZhbHVlPTxvcHRpbWl6ZWQgb3V0PikgYXQgLi9pbmNsdWRlL2FzbS1n
ZW5lcmljL2lvLmg6NTg0Cj4gMSAgbG9naWNfb3V0YiAodmFsdWU9MCAnXDAwMCcsIGFkZHI9MTg0
NDY3Mzk2NzU2Mzc4NzQ2ODkpIGF0IGxpYi9sb2dpY19waW8uYzoyOTkKPiAyICAweGZmZmY4MDAw
ODA4MmRmY2MgaW4gaW9fc2VyaWFsX291dCAocD0weDAsIG9mZnNldD0xNjc2MDgzMCwgdmFsdWU9
MCkgYXQgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0LmM6NDE2Cj4gMyAgMHhmZmZm
ODAwMDgwODJmZTM0IGluIHNlcmlhbF9wb3J0X291dCAodmFsdWU9PG9wdGltaXplZCBvdXQ+LCBv
ZmZzZXQ9PG9wdGltaXplZCBvdXQ+LCB1cD08b3B0aW1pemVkIG91dD4pCj4gICAgIGF0IC4vaW5j
bHVkZS9saW51eC9zZXJpYWxfY29yZS5oOjY3Nwo+IDQgIHNlcmlhbDgyNTBfZG9fc2V0X3Rlcm1p
b3MgKHBvcnQ9MHhmZmZmODAwMDgyOGVlOTQwIDxzZXJpYWw4MjUwX3BvcnRzKzE1Njg+LCB0ZXJt
aW9zPTB4ZmZmZjgwMDA4MjkyYjkzYywgb2xkPTB4MCkKPiAgICAgYXQgZHJpdmVycy90dHkvc2Vy
aWFsLzgyNTAvODI1MF9wb3J0LmM6Mjg2MAo+IDUgIDB4ZmZmZjgwMDA4MDgzMDA2NCBpbiBzZXJp
YWw4MjUwX3NldF90ZXJtaW9zIChwb3J0PTB4ZmZmZmZiZmZmZTgwMDAwMCwgdGVybWlvcz0weGZm
YmZmZSwgb2xkPTB4MCkKPiAgICAgYXQgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9wb3J0
LmM6MjkxMgo+IDYgIDB4ZmZmZjgwMDA4MDgyNTcxYyBpbiB1YXJ0X3NldF9vcHRpb25zIChwb3J0
PTB4ZmZmZjgwMDA4MjhlZTk0MCA8c2VyaWFsODI1MF9wb3J0cysxNTY4PiwgY289MHgwLCBiYXVk
PTExNTIwMCwgcGFyaXR5PTExMCwgYml0cz04LCBmbG93PTExMCkKPiAgICAgYXQgZHJpdmVycy90
dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmM6MjI4NQo+IDcgIDB4ZmZmZjgwMDA4MDgyODQzNCBpbiB1
YXJ0X3BvbGxfaW5pdCAoZHJpdmVyPTB4ZmZmZmZiZmZmZTgwMDAwMCwgbGluZT0xNjc2MDgzMCwg
b3B0aW9ucz0weGZmZmY4MDAwODI4Zjc1MDYgPGNvbmZpZys2PiAiMTE1MjAwbjgiKQo+ICAgICBh
dCBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYzoyNjU2Cj4gOCAgMHhmZmZmODAwMDgw
ODAxNjkwIGluIHR0eV9maW5kX3BvbGxpbmdfZHJpdmVyIChuYW1lPTB4ZmZmZjgwMDA4MjhmNzUw
MCA8Y29uZmlnPiAidHR5UzIsMTE1MjAwbjgiLCBsaW5lPTB4ZmZmZjgwMDA4MjkyYmE5MCkKPiAg
ICAgYXQgZHJpdmVycy90dHkvdHR5X2lvLmM6NDEwCj4gOSAgMHhmZmZmODAwMDgwODZjMGIwIGlu
IGNvbmZpZ3VyZV9rZ2Rib2MgKCkgYXQgZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jOjE5NAo+
IDEwIDB4ZmZmZjgwMDA4MDg2YzFlYyBpbiBrZ2Rib2NfcHJvYmUgKHBkZXY9MHhmZmZmZmJmZmZl
ODAwMDAwKSBhdCBkcml2ZXJzL3R0eS9zZXJpYWwva2dkYm9jLmM6MjQ5Cj4gMTEgMHhmZmZmODAw
MDgwOGIzOTljIGluIHBsYXRmb3JtX3Byb2JlIChfZGV2PTB4ZmZmZjAwMDAwMGViYjgxMCkgYXQg
ZHJpdmVycy9iYXNlL3BsYXRmb3JtLmM6MTQwNAo+IDEyIDB4ZmZmZjgwMDA4MDhiMGI0NCBpbiBj
YWxsX2RyaXZlcl9wcm9iZSAoZHJ2PTxvcHRpbWl6ZWQgb3V0PiwgZGV2PTxvcHRpbWl6ZWQgb3V0
PikgYXQgZHJpdmVycy9iYXNlL2RkLmM6NTc5Cj4gMTMgcmVhbGx5X3Byb2JlIChkZXY9MHhmZmZm
MDAwMDAwZWJiODEwLCBkcnY9MHhmZmZmODAwMDgyNzdmMTM4IDxrZ2Rib2NfcGxhdGZvcm1fZHJp
dmVyKzQ4PikgYXQgZHJpdmVycy9iYXNlL2RkLmM6NjU4Cj4gMTQgMHhmZmZmODAwMDgwOGIwZDJj
IGluIF9fZHJpdmVyX3Byb2JlX2RldmljZSAoZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEzOCA8a2dkYm9j
X3BsYXRmb3JtX2RyaXZlcis0OD4sIGRldj0weGZmZmYwMDAwMDBlYmI4MTApCj4gICAgIGF0IGRy
aXZlcnMvYmFzZS9kZC5jOjgwMAo+IDE1IDB4ZmZmZjgwMDA4MDhiMGViOCBpbiBkcml2ZXJfcHJv
YmVfZGV2aWNlIChkcnY9MHhmZmZmZmJmZmZlODAwMDAwLCBkZXY9MHhmZmZmMDAwMDAwZWJiODEw
KSBhdCBkcml2ZXJzL2Jhc2UvZGQuYzo4MzAKPiAxNiAweGZmZmY4MDAwODA4YjBmZjQgaW4gX19k
ZXZpY2VfYXR0YWNoX2RyaXZlciAoZHJ2PTB4ZmZmZjgwMDA4Mjc3ZjEzOCA8a2dkYm9jX3BsYXRm
b3JtX2RyaXZlcis0OD4sIF9kYXRhPTB4ZmZmZjgwMDA4MjkyYmM0OCkKPiAgICAgYXQgZHJpdmVy
cy9iYXNlL2RkLmM6OTU4Cj4gMTcgMHhmZmZmODAwMDgwOGFlOTcwIGluIGJ1c19mb3JfZWFjaF9k
cnYgKGJ1cz0weGZmZmZmYmZmZmU4MDAwMDAsIHN0YXJ0PTB4MCwgZGF0YT0weGZmZmY4MDAwODI5
MmJjNDgsCj4gICAgIGZuPTB4ZmZmZjgwMDA4MDhiMGYzYyA8X19kZXZpY2VfYXR0YWNoX2RyaXZl
cj4pIGF0IGRyaXZlcnMvYmFzZS9idXMuYzo0NTcKPiAxOCAweGZmZmY4MDAwODA4YjE0MDggaW4g
X19kZXZpY2VfYXR0YWNoIChkZXY9MHhmZmZmMDAwMDAwZWJiODEwLCBhbGxvd19hc3luYz10cnVl
KSBhdCBkcml2ZXJzL2Jhc2UvZGQuYzoxMDMwCj4gMTkgMHhmZmZmODAwMDgwOGIxNmQ4IGluIGRl
dmljZV9pbml0aWFsX3Byb2JlIChkZXY9MHhmZmZmZmJmZmZlODAwMDAwKSBhdCBkcml2ZXJzL2Jh
c2UvZGQuYzoxMDc5Cj4gMjAgMHhmZmZmODAwMDgwOGFmOWY0IGluIGJ1c19wcm9iZV9kZXZpY2Ug
KGRldj0weGZmZmYwMDAwMDBlYmI4MTApIGF0IGRyaXZlcnMvYmFzZS9idXMuYzo1MzIKPiAyMSAw
eGZmZmY4MDAwODA4YWM3N2MgaW4gZGV2aWNlX2FkZCAoZGV2PTB4ZmZmZmZiZmZmZTgwMDAwMCkg
YXQgZHJpdmVycy9iYXNlL2NvcmUuYzozNjI1Cj4gMjIgMHhmZmZmODAwMDgwOGIzNDI4IGluIHBs
YXRmb3JtX2RldmljZV9hZGQgKHBkZXY9MHhmZmZmMDAwMDAwZWJiODAwKSBhdCBkcml2ZXJzL2Jh
c2UvcGxhdGZvcm0uYzo3MTYKPiAyMyAweGZmZmY4MDAwODFiNWRjMGMgaW4gaW5pdF9rZ2Rib2Mg
KCkgYXQgZHJpdmVycy90dHkvc2VyaWFsL2tnZGJvYy5jOjI5Mgo+IDI0IDB4ZmZmZjgwMDA4MDAx
NGRiMCBpbiBkb19vbmVfaW5pdGNhbGwgKGZuPTB4ZmZmZjgwMDA4MWI1ZGJhNCA8aW5pdF9rZ2Ri
b2M+KSBhdCBpbml0L21haW4uYzoxMjM2Cj4gMjUgMHhmZmZmODAwMDgxYjAxMTRjIGluIGRvX2lu
aXRjYWxsX2xldmVsIChjb21tYW5kX2xpbmU9PG9wdGltaXplZCBvdXQ+LCBsZXZlbD08b3B0aW1p
emVkIG91dD4pIGF0IGluaXQvbWFpbi5jOjEyOTgKPiAyNiBkb19pbml0Y2FsbHMgKCkgYXQgaW5p
dC9tYWluLmM6MTMxNAo+IDI3IGRvX2Jhc2ljX3NldHVwICgpIGF0IGluaXQvbWFpbi5jOjEzMzMK
PiAyOCBrZXJuZWxfaW5pdF9mcmVlYWJsZSAoKSBhdCBpbml0L21haW4uYzoxNTUxCj4gMjkgMHhm
ZmZmODAwMDgxMDI3MWVjIGluIGtlcm5lbF9pbml0ICh1bnVzZWQ9MHhmZmZmZmJmZmZlODAwMDAw
KSBhdCBpbml0L21haW4uYzoxNDQxCj4gMzAgMHhmZmZmODAwMDgwMDE1ZTgwIGluIHJldF9mcm9t
X2ZvcmsgKCkgYXQgYXJjaC9hcm02NC9rZXJuZWwvZW50cnkuUzo4NTcKPgo+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0t
LQo+IHYxIC0+IHYyOgo+ICAgICAgICAgLSBmaXggaWYgY29uZGl0aW9uIGR1cmluZyBzdWJtaXNz
aW9uCj4gICAgICAgICAtIGltcHJvdmUgYSBiaXQgdGhlIGNvbW1pdCBtZXNzYWdlCj4gUkZDIC0+
IHYxOgo+ICAgICAgICAgLSByZWZ1c2UgdWFydCB0aGF0IGhhcyB0eXBlIFBPUlRfVU5LTk9XTgo+
Cj4gLS0tCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkknbSBub3QgYSB0b3Rh
bCBleHBlcnQgb24gdGhpcyBjb2RlLCBidXQgdGhpcyBzZWVtcyByZWFzb25hYmxlIHRvIG1lLgpP
bmUgbml0IGlzICR7U1VCSkVDVH0gc2hvdWxkIHByb2JhYmx5IGJlICJrZ2RiIG92ZXIgc2VyaWFs
IiBpbnN0ZWFkIG9mCiJrZ2Qgb3ZlciBzZXJpYWwiCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5
L3NlcmlhbC9zZXJpYWxfY29yZS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMK
PiBpbmRleCBmMTM0OGE1MDk1NTIuLjliN2VkNGFhYzc3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJp
YWxfY29yZS5jCj4gQEAgLTI2MzMsNyArMjYzMyw3IEBAIHN0YXRpYyBpbnQgdWFydF9wb2xsX2lu
aXQoc3RydWN0IHR0eV9kcml2ZXIgKmRyaXZlciwgaW50IGxpbmUsIGNoYXIgKm9wdGlvbnMpCj4g
ICAgICAgICBtdXRleF9sb2NrKCZ0cG9ydC0+bXV0ZXgpOwo+Cj4gICAgICAgICBwb3J0ID0gdWFy
dF9wb3J0X2NoZWNrKHN0YXRlKTsKPiAtICAgICAgIGlmICghcG9ydCB8fCAhKHBvcnQtPm9wcy0+
cG9sbF9nZXRfY2hhciAmJiBwb3J0LT5vcHMtPnBvbGxfcHV0X2NoYXIpKSB7Cj4gKyAgICAgICBp
ZiAoIXBvcnQgfHwgcG9ydC0+dHlwZSA9PSBQT1JUX1VOS05PV04gfHwgIShwb3J0LT5vcHMtPnBv
bGxfZ2V0X2NoYXIgJiYgcG9ydC0+b3BzLT5wb2xsX3B1dF9jaGFyKSkgewoKQW5vdGhlciBzbGln
aHQgbml0IGlzIHRoYXQgdGhlIGFib3ZlIGxpbmUgZmVlbHMgYSBsaXR0bGUgbG9uZywKY2xvY2tp
bmcgaW4gYXQgMTEwIGNvbHVtbnMuIEkga25vdyB0aGUgODAgY29sdW1uIGxpbWl0IGlzbid0IHNv
IGZpcm0KdGhlc2UgZGF5cywgYnV0IGlmIGl0IHdlcmUgbWUgSSdkIHNwbGl0IGl0IGFjcm9zcyAy
IGxpbmVzLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
