Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64AB2ADF0
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 18 Aug 2025 18:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbqthYz3T6QL3jwnCxoY4mUnO5vLG5FVekwLit5Rt+Q=; b=Bdd6N+63ZllnOMXhT+kxtSa2hE
	UWMzY9ra3CE5LrGvki768TlCPltz39Q06yCKjQIkaCMaQQdKY8GF1sQoC3OsEjTIQbuwMv4yEZVZZ
	w4CWFhL0SJpNBePcMc8R2IKqlFBR2lKoAiTyaO/QpF0xfMH5PLzquqbf9qDcaoSXOw8Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1uo2Yt-0002Ho-3q
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 18 Aug 2025 16:18:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1uo2Ys-0002Hg-3j
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 16:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZSyqJhkRW/MDWE6bia3ikOdWhAKQSCvYd+GVVssfN+c=; b=lSxgXBS3y6apUfuWjHsXUkFstu
 LvgSSBugVvqK8d9W9xQtHG+0+IkcQUktabZM/SN5rB3AnQYJ6fZ5Ac28p5HfVUSA4vGw/CNM0nda4
 Yr/bMuRmcwTfad0bgvuvRAGS2Ng4BbbhVFAGyb1ITktWEvWjX9awg+2BdbfsaD6xFJEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZSyqJhkRW/MDWE6bia3ikOdWhAKQSCvYd+GVVssfN+c=; b=KhfQX/uCfJR68/7w9u4KgF7MoC
 5j9e/ecz5lKCJUD83IKtQNKiGidGPVtWiOBtNflt2fgyTUXacCahxVEm4zbg7H/EI9k5P+E2OLmoL
 /m6iFRBQxBHKpcKSX6hhtWjUT3j4zLTVv3sxbJVK266RX+ETU0p/ULoYsUzSUfjBngoQ=;
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uo2Yr-00027j-JV for kgdb-bugreport@lists.sourceforge.net;
 Mon, 18 Aug 2025 16:18:18 +0000
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76e2e629fc4so4512149b3a.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 09:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755533884; x=1756138684;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZSyqJhkRW/MDWE6bia3ikOdWhAKQSCvYd+GVVssfN+c=;
 b=cnWYpXOBs8dnP5EJRvFwwnPPkKyvHtyiIQMepavRdc9YbwpZvQCZQOQI+cKKtm4NxH
 EzJ2pb8eJc+w/HiZivcnZzu2CODq0VBHpG4Q4nKjGrTCchIu/KbgtlV2fXqxK//ZSwCi
 KYDrfO/q4D0NkgvAOICVqs5bIft8aY1xgow/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755533884; x=1756138684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZSyqJhkRW/MDWE6bia3ikOdWhAKQSCvYd+GVVssfN+c=;
 b=Aw/nauPc4z1kXz8ojUVRMA/9o3MQdn2CIYc8+NyeANJKkNGNOnjB8xD+xR1b8bcsZS
 NY0GOc2yfJ7IPt0b9DVuCdwWjbmM2KOliQhqOkjndfuUhSwhrxv5mLi3y9h/Z+z/xk9L
 /LDQJMhIFaVNHm7A6/Ka+6t69ojOrGExnJ2j61QO8kai66L/9TLmqU1PM8Vj0ieDWtJ+
 R8TbeJZL+xVulCgFiJPwlfqzY2zKpV7e0SSpWs8JYy7codmX//4qGlX3KEdQW+gyn3Lk
 /92sgv2GMbcSLJXl+f/nZrHvN98K6k4xKxvGCLq8QRvBOFw98zBKC+ZhTiX/TC8sfCJe
 XmtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8o7pMfs8gWo3bY9i2RSTNgBAceRaN0HsIPfNtJQB3P9NMa0MDpqAy1AISwYUTyyZoGdhjPs9YQQMneSI2Gw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzL+X3g2+6fOov08TRGM0ecwmQf94P0l3EDhhDUAEjxvjw0ivBy
 RC2uS9JZdscC23bqM+Zsl3Hac4nvY2b69mhq8WKN3c4SxcPrusqvtDN401yKTjDP8c0P5hCS25U
 qYlA=
X-Gm-Gg: ASbGnctCiv+IscK73jemxWso+jxs/fcDSuwlzyNpi9LXdETZ9tqOaAhdKh6+KI0+YFs
 UBn+AV4szBRXWK1t2rHjh++ge1Fsj1PP+2z6/WEimLKX3x6ojXMcguxwmKnDKpJk/nHD5/YxQgQ
 9pgAS1wEU3/d5ucxRlrA8zc/YUX2XYIGpgTfeuNdu8uN4u2uo0tAQfpsVnwkBBjplDnuinH7wVI
 yImUFQyXb/3TzKylZ+xlCBEdx2kCQe0S66bdWyASChK+i/Dpz5vV3CgvmWuh6/qIL2+4raj+wBs
 qTXn1wy2e1v24vWANbc9+pHX5TwNCLCiAFtjQgWpVzs02cTNeO0adWHJxInVVVwnzaIzF3h/MjG
 G2xMEluS3v8a+ehy7VG/dpJY7ds/bNIoul52rAHrD5krh8p8LxS5PbqRR4rbd+4fCbg==
X-Google-Smtp-Source: AGHT+IEXqyQyj+RiL4M/TXwuxYWvfu/D+ZnwBsknYhWBwz0uQskOUWTjOGH5lc8o5c1uNtNm9zu/bQ==
X-Received: by 2002:a05:6a00:895:b0:730:95a6:3761 with SMTP id
 d2e1a72fcca58-76e446bf514mr19821021b3a.3.1755533884211; 
 Mon, 18 Aug 2025 09:18:04 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d5248e4sm29747b3a.80.2025.08.18.09.18.00
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 09:18:00 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-244581caca6so32915195ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 18 Aug 2025 09:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUcgyn9W+feuPYawqYccS7ZEuesR1eXnmIRWt3EstLSPtwvAemPrfZR3n3kAKp1DcyrvYU7G3U0tO51LnVqg==@lists.sourceforge.net
X-Received: by 2002:a17:903:b87:b0:240:80f:228e with SMTP id
 d9443c01a7336-2446d93d8dbmr168541425ad.52.1755533879674; Mon, 18 Aug 2025
 09:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250718213725.348363-2-thorsten.blum@linux.dev>
 <CAD=FV=W1tgwvajXD6mcggHKy=Q7EN8wLx4nSJgy0NJBzHLBnSg@mail.gmail.com>
 <A627E42A-1F2C-4807-B2AD-089D94FCB210@linux.dev>
In-Reply-To: <A627E42A-1F2C-4807-B2AD-089D94FCB210@linux.dev>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 09:17:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtB7BB0vo9FDncgCraCwLMZyYZHYKhs5BprzDcHYQFWQ@mail.gmail.com>
X-Gm-Features: Ac12FXyuTFomjGqpD0gstTADqywrtRi3JiXkcPd3XuZbN_O76LE11WCVw65yoBs
Message-ID: <CAD=FV=WtB7BB0vo9FDncgCraCwLMZyYZHYKhs5BprzDcHYQFWQ@mail.gmail.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Aug 18,
 2025 at 4:03 AM Thorsten Blum <thorsten.blum@linux.dev>
 wrote: > > Hi Doug, > > On 19. Jul 2025, at 00:48, Doug Anderson wrote: >
 > On Fri, Jul 18, 2025 at 2:40 PM Thorsten Blum wrote: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uo2Yr-00027j-JV
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Replace deprecated strcpy() with
 strscpy()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Zhang Heng <zhangheng@kylinos.cn>, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIEF1ZyAxOCwgMjAyNSBhdCA0OjAz4oCvQU0gVGhvcnN0ZW4gQmx1bSA8dGhv
cnN0ZW4uYmx1bUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gSGkgRG91ZywKPgo+IE9uIDE5LiBKdWwg
MjAyNSwgYXQgMDA6NDgsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBPbiBGcmksIEp1bCAxOCwg
MjAyNSBhdCAyOjQw4oCvUE0gVGhvcnN0ZW4gQmx1bSB3cm90ZToKPiA+Pgo+ID4+IHN0cmNweSgp
IGlzIGRlcHJlY2F0ZWQ7IHVzZSBzdHJzY3B5KCkgaW5zdGVhZC4KPiA+Pgo+ID4+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy84OAo+ID4+IFNpZ25lZC1vZmYtYnk6
IFRob3JzdGVuIEJsdW0gPHRob3JzdGVuLmJsdW1AbGludXguZGV2Pgo+ID4+IC0tLQo+ID4+IGtl
cm5lbC9kZWJ1Zy9rZGIva2RiX3N1cHBvcnQuYyB8IDQgKysrLQo+ID4+IDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBuaXQ6IFNpbmNlIHRoaXMg
b25seSBjb3ZlcnMgdGhpbmdzIGluIHRoZSBmaWxlIGBrZGJfc3VwcG9ydC5jYCBhbmQgbm90Cj4g
PiBldmVyeXRoaW5nIGluIGtlcm5lbC9kZWJ1Zy9rZGIsIHBlcmhhcHMgdGhhdCBzaG91bGQgYmUg
aW4gdGhlIHN1YmplY3QKPiA+IGxpbmU/IE1heWJlICJrZGI6IFJlcGxhY2UgZGVwcmVjYXRlZCBz
dHJjcHkoKSB3aXRoIHN0cnNjcHkoKSBpbgo+ID4ga2RiX3N0cmR1cCgpIj8KPiA+Cj4gPiBPdGhl
ciB0aGFuIHRoYXQsIHRoaXMgbG9va3MgZmluZSB0byBtZS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTog
RG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+Cj4gSSdtIHByZXBhcmlu
ZyBhIHBhdGNoIHNlcmllcyBmb3IgRGFuaWVsIHdpdGggbXkga2RiIGNoYW5nZXMuCj4KPiBGb3Ig
dGhpcyBvbmUgaGVyZSwgSSBpbml0aWFsbHkgdXNlZDoKPgo+ICAgICAgICAgc3Ryc2NweShzLCBz
dHIsIG4pOwo+ICAgICAgICAgcmV0dXJuIHM7Cj4KPiB0byByZXBsYWNlICdyZXR1cm4gc3RyY3B5
KHMsIHN0cik7JywgYnV0IG5vdyBwcmVmZXI6Cj4KPiAgICAgICAgIG1lbWNweShzLCBzdHIsIG4p
Owo+ICAgICAgICAgcmV0dXJuIHM7Cj4KPiBiZWNhdXNlIHdlIGFscmVhZHkga25vdyB0aGUgc3Ry
aW5nIGxlbmd0aCAnbicuCj4KPiBDYW4gSSBrZWVwIHlvdXIgUmV2aWV3ZWQtYnk6IHRhZyB3aGVu
IG1ha2luZyB0aGlzIGNoYW5nZSBhbmQgc3VibWl0dGluZwo+IGl0IGFzIHBhcnQgb2YgYSBwYXRj
aCBzZXJpZXM/CgpTdXJlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8va2dkYi1idWdyZXBvcnQK
