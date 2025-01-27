Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B7A1FFA6
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Jan 2025 22:28:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tcWf6-0004Cr-Vv
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 27 Jan 2025 21:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1tcWf5-0004Ck-FE
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Jan 2025 21:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W72o3oyqIh4qfBH08voEuMjAfflwX9qYoTdf5JqMZ9I=; b=OqXzlFwz0rN7zG/tW1ix20k0aF
 /mtDkXuN+N17dlH3DaZbl2pTpfmB4D4QR+TqT5Op+UZN2Ki88s0VmsLyMD6SpCX1lqXT8rkOabXzs
 1pzOdjnDLvV9GnJynfJKyafH7dG2KW7/MZUvUod2BYB2i10scPvZOBAs8xs8uv+E2VfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W72o3oyqIh4qfBH08voEuMjAfflwX9qYoTdf5JqMZ9I=; b=QrCobwh468rT9YI7aYr7mGy6QY
 Ru31YxBjKTA2BLG5GNyHT4vhfisCp6HRpdQuulSvqx9GRDKSf5yxS0bHIfGgVqZav4OSVA5/R350+
 j7hkfYfdo4TvFON2bd/qL221Em11yvalxTuGHOoUldSv+ITvVX+gdqJDVCetpGH5yGWE=;
Received: from mail-lf1-f41.google.com ([209.85.167.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tcWf4-0004hT-7M for kgdb-bugreport@lists.sourceforge.net;
 Mon, 27 Jan 2025 21:28:50 +0000
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so5260582e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Jan 2025 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738013322; x=1738618122;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W72o3oyqIh4qfBH08voEuMjAfflwX9qYoTdf5JqMZ9I=;
 b=KHKC6YXdVRgz6oew93PFdR9ZDJ5/tFjyULpEog+EeAy9RLNH3gN0n1bJFQfBPpPYbm
 8grjbB+powTuQsQtcK+ujQzyrcwFAiZ836hs9IL9x2d1S3DQ05rdrBdSQ5r2Yvk7yI40
 ut4Wp/8/BpWLd+LWbSd3Lw9LpKGwoDpuxs3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738013322; x=1738618122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W72o3oyqIh4qfBH08voEuMjAfflwX9qYoTdf5JqMZ9I=;
 b=olL97FQrvQ3LXhpLCUvg1VL5YO5WRTm36cJ6wD4SXcnF4JEAvm04kk5SVmaJ+DFbb6
 tZKkFrs+hAQlbl5yDtTjldcO06OEKLO1rBrSDp89dUHXpxhqXWKk3O3tLFVtYtTY8YB3
 wAEW4539DkCdzvFOWQHHobtffv9tIVtuiwe+MiJM7kuzpPLbMVzSmcVXZbvIgEPCwpbf
 3MPRM3q8ILoc5ssSepJOCuZf/zpriwCavvEtgQfQVBgEOhQhml0jRissY+ppLHGXeZbe
 cpSjseEa30HjrQzp8HmXHR9q2Kk2WrJLQhz6LImCdyV5Yn/eluxVYW7hQZBgjTSm6eVy
 Ix9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX46oDepWlajZDbvRgW8r1nI0rthDwfHDMY8lxLOu/gWnwIErp1LsMXDBEc5z4TN9ekhEEk66z7jbHyO2vUEA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwnVgZ2b0aDsOfC4PG20Ke/CnfLI7yRzl/Ffi8YmHer9RzpJbIH
 uGTsx4XSp5z5PmiieayqEI1UcXTkOCa59llk3YxPvItn+O3exjxE/W2rWh1PrEQcYRd6a3gcbh3
 IGkWI
X-Gm-Gg: ASbGncsxDAcf1WdSuFOEN2oYZxWD7DRkzfqeS2s1slakbL0Yq0aAk7QC8aPlQ4fMQPk
 ihNaaDk4lf3dhecqGSncUn/KGJSZwlFJBy3nzQUcNBUXLgfjx3IMfai84lzgIzsFYcknWNN3feQ
 BW6br7OWUMak9TM1yXJN5yPsDDbL/fZFa2efHuFCXPfZgy/JKqiDUrhGP5G8QKHrqda+aaBDHMT
 VTvGi/Lp5Wo1IWnktzmheZ82sEQh0WEgPcU71YrgF+8sg6856l6lK6Kzd4fJ8hhwSeZSDLyP8go
 G7UcRxDlgs0jkdjJaj5Op1EPGRuXfmjnhczUbV5O5So8ZHBN
X-Google-Smtp-Source: AGHT+IGgYJGOErMhLqkao+bV8JvVyHjuHkwUAHVdyG8MTlI/+bncaE29jEAv+ksnxJUdSaY5ladWMg==
X-Received: by 2002:ac2:4463:0:b0:540:1f75:1b05 with SMTP id
 2adb3069b0e04-5439c229169mr11965476e87.19.1738013322011; 
 Mon, 27 Jan 2025 13:28:42 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c822f81csm1431852e87.74.2025.01.27.13.28.36
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 13:28:37 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so50012601fa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Jan 2025 13:28:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9Y60K+qwSuKM/dbl2iZ2Hiqsa8/WLfCPA/LbKu4ptSjx4Q1QacvjJ/d+jD1MgqxJNHIN1sgnsVYWTbakHFw==@lists.sourceforge.net
X-Received: by 2002:a2e:a26c:0:b0:300:3307:389c with SMTP id
 38308e7fff4ca-3072ca5eb99mr116706371fa.3.1738013315066; Mon, 27 Jan 2025
 13:28:35 -0800 (PST)
MIME-Version: 1.0
References: <Z5VT658i9S1lEZNe@casper.infradead.org>
 <Z5Xwq76oNZweVS8J@aspen.lan>
In-Reply-To: <Z5Xwq76oNZweVS8J@aspen.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2025 13:28:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7ZZkkumLhbiadKFpDS=P6w7XTTy=+OjUdw_3dK_bBqw@mail.gmail.com>
X-Gm-Features: AWEUYZl-TPpI0EKEgiH-BNYEw3tQzSdTByjQaRT3KLWnly-m-eLqtL_O5Uji3Dg
Message-ID: <CAD=FV=U7ZZkkumLhbiadKFpDS=P6w7XTTy=+OjUdw_3dK_bBqw@mail.gmail.com>
To: Daniel Thompson <danielt@kernel.org>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Sun, Jan 26, 2025 at 12:22 AM Daniel Thompson <danielt@kernel.org>
    wrote: > > On Sat, Jan 25, 2025 at 09:13:15PM +0000, Matthew Wilcox wrote:
    > > This is a bad patch. It looks like you should hav [...] 
 
 Content analysis details:   (-1.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.167.41 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.167.41 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.41 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.41 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcWf4-0004hT-7M
Subject: Re: [Kgdb-bugreport] kdb: use kmap_local_page()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Zhang Heng <zhangheng@kylinos.cn>,
 Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBTdW4sIEphbiAyNiwgMjAyNSBhdCAxMjoyMuKAr0FNIERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsdEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSmFuIDI1LCAyMDI1IGF0IDA5
OjEzOjE1UE0gKzAwMDAsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gVGhpcyBpcyBhIGJhZCBw
YXRjaC4gIEl0IGxvb2tzIGxpa2UgeW91IHNob3VsZCBoYXZlIHVzZWQKPiA+IG1lbWNweV9mcm9t
X3BhZ2UoKS4KPgo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+Cj4gSnVzdCB0byBjaGVjaywg
aW4gdGhpcyBjYXNlIGRvZXMgImJhZCBwYXRjaCIgbWVhbiBmdW5jdGlvbmFsbHkKPiBpbmNvcnJl
Y3Qgb3Igc2ltcGx5IHRoYXQga2RiIGlzIG9wZW4gY29kaW5nIHNvbWV0aGluZyBmb3Igd2hpY2gK
PiBiZXR0ZXIgaGVscGVycyBleGlzdC4KPgo+IFRvIGJlIGNsZWFyLCB3ZSBzaG91bGQgZml4IGVp
dGhlciB3YXksIGJ1dCBJIHdhbnRlZCB0byBjaGVjawo+IHRoZSBpbXBhY3QuCgpGV0lXLCBpdCBz
ZWVtcyBoYXJkIHRvIGJlbGlldmUgaXQgd291bGQgaGF2ZSBhbnkgYWN0dWFsIGltcGFjdC4gVGhl
CmN1cnJlbnQgZGVmaW5pdGlvbiBvZiBtZW1jcHlfZnJvbV9wYWdlKCkgdGhhdCBJIHNlZSBpcyBs
aXRlcmFsbHkgZG9pbmcKdGhlIGV4YWN0IHNhbWUgdGhpbmcgYXMgd2UncmUgZG9pbmcgbm93IGlu
IGtkYi4gSSBhZ3JlZSB3aXRoIERhbmllbAp0aGF0IHNvbWVvbmUgc2hvdWxkIHN1Ym1pdCBhIHBh
dGNoIHRvIGltcHJvdmUgaXQgdG8gdXNlCm1lbWNweV9mcm9tX3BhZ2UoKSB0byBzYXZlIDIgbGlu
ZXMgb2YgY29kZSwgYnV0IEknbSBub3Qgc28gc3VyZSBJJ2QKY2FsbCB0aGUgY3VycmVudCBjb2Rl
ICJiYWQiLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2tnZGItYnVncmVwb3J0Cg==
