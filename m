Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F080DDC4
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 11 Dec 2023 23:00:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rCoKT-0007sX-3a
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 11 Dec 2023 22:00:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1rCoKS-0007sR-A7
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DO+nyfi2K4OSqpRKBzov3KLKX0ti76DlsnoVE34DwM=; b=fpmn9n5th8QERna3iH0lnRJ2Xk
 hju12lIIysdt7Orn6x8u1PvkvarC6a+YrYZh4kOHTq581zEvDX/KtpQeil3NOxkZVbqMFJgBtUiML
 g4rx0EKyEUAf4fr30aLlzF8nXEE3JHBnuYUNnZooKY+rLoRTElwC0FeZ6A9XjIQ5xPww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DO+nyfi2K4OSqpRKBzov3KLKX0ti76DlsnoVE34DwM=; b=ACOzUfcvA3rrOU/rgsM8SyNKio
 ek1I/uaszG1wLkhI1fwAYqu6YNxJj0s0JaVCeFZKH5S8b1VN6TTEhx7voyjbl0HN8CG7BSo9/HvZe
 TOg1WQGjttZRv1BBJmBh8rEK85hWF9EOtV6/ub+aUKAln3sLucsG7WQ3fOSi6xfhxu8M=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rCoKQ-0005Qd-ND for kgdb-bugreport@lists.sourceforge.net;
 Mon, 11 Dec 2023 22:00:44 +0000
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-54c671acd2eso6677653a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Dec 2023 14:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702332028; x=1702936828;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DO+nyfi2K4OSqpRKBzov3KLKX0ti76DlsnoVE34DwM=;
 b=JjpMphBqWf9Eq4Qh1ZaMR+IIAsu+QSFU2Xm8tMSbu5gfDMAKUgp2uSTbehJDRXXxvS
 f7dA1WIcCrUA9Hqnejlmbpzzc9gUpySn3MXZNwqFHd7tw5P4j7Fj2sFjoeVn6uFlSzwf
 tduG8asZmv3gdypTYZj2/KGztCUMNhw+laYyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332028; x=1702936828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DO+nyfi2K4OSqpRKBzov3KLKX0ti76DlsnoVE34DwM=;
 b=KOSM5/hus+muvjcPTMR7rKBem74eG792TPiGQLmamATGE/sRmWlbJ9jF9Phi0IHFDs
 zLGz6ewApTiphobAV5/p4jE+b5waeXQEqvfz4mU3xjHCpdfaGp2Cr/33CiMpvINel8Hd
 3HiNBN0RxtlGwfQQTM5hBnG5417PPKZ+Eja7Z4sPjYdR9Ie4GgxVMzEATUnOg9zPdCHl
 G/r0G/27lYAZ1e2gPeo6P13zgGwc7LOYMD0HscdP5DUP8qMYuIUDFnFMLZtkmpNIK/PO
 CDR/0F/nmFIrgn242UyvhoNMOs9BpwaKAJiiUVrIV7u2otl3cKjlw8oG4czNPNq5k2bg
 XSEA==
X-Gm-Message-State: AOJu0Ywr7ODupAoUkEgVQDTpUpN9J/GTeDjc5uoUgQdrBE64MWVcVb6/
 ejqjgqLgEEl957Ck4hDJ3VwqWnqZVcQvgP2DNhngOm88
X-Google-Smtp-Source: AGHT+IH5qFKMqH7rUo2BpCHEeU+M2gIRDxuDKdqFMLzU23nUKcVRERlnl9Ya+sG3xCCVT+D16F4m5g==
X-Received: by 2002:a05:6402:619:b0:54c:4837:9405 with SMTP id
 n25-20020a056402061900b0054c48379405mr4046738edv.76.1702332027935; 
 Mon, 11 Dec 2023 14:00:27 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 l28-20020a50d6dc000000b0054ca3df2257sm4252555edj.36.2023.12.11.14.00.25
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 14:00:25 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40c2db0ca48so5465e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 11 Dec 2023 14:00:25 -0800 (PST)
X-Received: by 2002:a05:600c:1e27:b0:40c:256f:756b with SMTP id
 ay39-20020a05600c1e2700b0040c256f756bmr256453wmb.2.1702332024792; Mon, 11 Dec
 2023 14:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208212845.1679621-1-michael@amarulasolutions.com>
 <CAD=FV=WthrukuM5e6VH4wKH0CQ5k08A_g_Ehpo-NsouxxCiibw@mail.gmail.com>
 <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
In-Reply-To: <CAOf5uwmT3uFQhyTOkNDMana5na5jcKm81tdyeann2UnFwaQp5w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Dec 2023 14:00:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
Message-ID: <CAD=FV=WrBg9PuDW__pZbo5YNuWct17gcK4FF-xKeyxEOsw6Qag@mail.gmail.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Dec 11, 2023 at 1:42 PM Michael Nazzareno Trimarchi
    <michael@amarulasolutions.com> wrote: > > > 1. init_kgdboc() runs and registers
    the singleton kgdb "platform driver". > > > > 2. The platf [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCoKQ-0005Qd-ND
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

SGksCgpPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxOjQy4oCvUE0gTWljaGFlbCBOYXp6YXJlbm8g
VHJpbWFyY2hpCjxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+ID4gMS4g
aW5pdF9rZ2Rib2MoKSBydW5zIGFuZCByZWdpc3RlcnMgdGhlIHNpbmdsZXRvbiBrZ2RiICJwbGF0
Zm9ybSBkcml2ZXIiLgo+ID4KPiA+IDIuIFRoZSBwbGF0Zm9ybSBkcml2ZXIncyBwcm9iZSBmdW5j
dGlvbiwga2dkYm9jX3Byb2JlKCksIHJ1bnMgYW5kCj4gPiBjaGVja3MgdG8gc2VlIGlmIHRoZSBj
b25zb2xlIGlzIHJlYWR5IGJ5IGxvb2tpbmcgYXQgdGhlIHJldHVybiB2YWx1ZQo+ID4gb2YgY29u
ZmlndXJlX2tnZGJvYygpLiBJZiBpdCdzIHJlYWR5IHRoZW4gd2UncmUgZ29vZCB0byBnby4gSWYg
aXQncwo+ID4gbm90IHJlYWR5IHRoZW4gd2UgZGVmZXIuCj4gPgo+ID4gU28gSSB0aGluayB0aGUg
YnVnIGhlcmUgaXMgdGhhdCBzb21laG93IHRoZSBjb25zb2xlIGxvb2tzICJyZWFkeSIKPiA+IChi
ZWNhdXNlIHR0eV9maW5kX3BvbGxpbmdfZHJpdmVyKCkgY2FuIGZpbmQgaXQpIGJ1dCBpdCBpc24n
dCBhY3R1YWxseQo+ID4gcmVhZHkgeWV0IChiZWNhdXNlIGl0IGNyYXNoZXMpLiBUaGF0J3Mgd2hh
dCB5b3UgbmVlZCB0byBmaXguCj4gPgo+Cj4gVGhlIHBvbGxpbmcgZHJpdmVyIGxvb2sgZm9yIHVh
cnQgYW5kIHVhcnQ4MjUwX2NvcmUgaXMgcmVnaXN0ZXJlZCBhbmQgNCBmYWtlIHVhcnQKPiBhcmUg
dGhlcmUgYnV0IHRoZXJlIGFyZSBub3Qgc3RpbGwgcmVwbGFjZWQgYnkgcGxhdGZvcm0gZHJpdmVy
IHRoYXQgY2FuCj4gY29tZSBsYXRlci4KPiBUaGUgdHJ5X3BvbGxpbmcgZmluZCBpdCBidXQgaXQn
cyB0aGUgaXNhLTgyNTAgZHJpdmVyLiBJdCBtZWFucyB0aGF0Cj4gYWRkX3VhcnQgODI1MCBpcwo+
IG5vdCBzdGlsbCBoYXBwZW4KClRoZSA4MjUwIGRyaXZlciBpcyBhbHdheXMgYSBtYXplLCBzbyB5
b3UgbWlnaHQgbmVlZCB0byBkbyBhIGJ1bmNoIG9mCmRpZ2dpbmcuIC4uLmJ1dCBpdCBzdXJlIHNv
dW5kcyBsaWtlIHRoZSBjb25zb2xlIHNob3VsZG4ndCBiZQpyZWdpc3RlcmVkIHVudGlsIHRoZSBj
b3JyZWN0IG9wcyBhcmUgaW4gcGxhY2UuIFRoYXQgZWl0aGVyIG1lYW5zCmdldHRpbmcgdGhlIG9w
cyBwdXQgaW4gcGxhY2UgZWFybGllciBvciBkZWZlcnJpbmcgd2hlbiB0aGUgY29uc29sZSBpcwpy
ZWdpc3RlcmVkLi4uCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8va2dkYi1idWdyZXBvcnQK
