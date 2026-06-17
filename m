Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UBZRG3LlMmqG6wUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 20:20:34 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A169BEB7
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 20:20:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=aAEd8LdG;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=KL31QwYw;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=nUdu1Dfi;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=CNKI0Mm3;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8ve7+yvYEboQTf8q8B96+acLsl9VdQlT2HT8vLUJRs=; b=aAEd8LdGYJK1DmRJpJ19yU7IbY
	m2DoDtUwERdUYvqK+1r3td27FoFHgQ/eYtirgkxWyoIhcUYPSbjfPyGgBDU1jdTugDFVXsVmxBE5J
	qoGZm8MiM/FJFvBtQKHakZU5ZxwOJyFaZIH26MTu0AkonCDbaBAevDUf9x2Xky04xEWQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZusJ-0003UE-HE
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Jun 2026 18:20:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZusI-0003U0-2s
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 18:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BFwILo+4FMSEGU6cChCwVQV+go5QZ/BMavnjYkFHpVs=; b=KL31QwYwjz6v2aR6ABhhE0po4j
 OnYF32TAAvGB037bywCVA9oHjBVMSbwMBshSKe9ZxyBPao3KqXCeRmupuuqIjnucdkYDgpZokhqvF
 2o1I99ElCYEzby5yhVUZk/YEOmgxQeYMmAjoaL4C2U4rpQ8sS+GhBeF7DylV/laCGpzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BFwILo+4FMSEGU6cChCwVQV+go5QZ/BMavnjYkFHpVs=; b=nUdu1DfiNA0Lxo/QvWdpwfTByW
 Rp0pmOeV76xpB2Z8rajqMaS8gnNbjYnrOMKJOVS3paArbjYRK5oVRCNAMmvvCa/HJY/RmjODmCnAc
 SrhlrOPOSKPtxK8fDkg2PkXNtZPiNX7OFYApTt/uK+PUcMm9893G5DwEiLGisaBcGjhY=;
Received: from mail-vs1-f41.google.com ([209.85.217.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZusI-0007KY-05 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 18:20:30 +0000
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-7269038ad05so74982137.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Jun 2026 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781720424; x=1782325224;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFwILo+4FMSEGU6cChCwVQV+go5QZ/BMavnjYkFHpVs=;
 b=CNKI0Mm3qvEHkhTWHWNfMeYoGyJNcXKmjojX5f238s3hvLHc1/VChTvWf6gd2Rzzoy
 T3J2XzssSe35yZMbNsRjX6R4wwCFS57KHR5JZauVRUmQIS9y/jn1v+hzePW7vCeSe1ll
 Eivuk02o5dcZoEsTaKw4wBve+1dr+G+zmcT+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781720424; x=1782325224;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BFwILo+4FMSEGU6cChCwVQV+go5QZ/BMavnjYkFHpVs=;
 b=FbJZmQPkp7DIUeP4JciNMyFJ9y1qK5YbmNFSl/zg6901pCHI2W/NpjjoSmsqohr3B2
 bXHUSzv+noHf+NM0kkMN2VsRcW2FDk6lnFPNo+WrRnRK+KeCLCzDX9ckbWkfeW2QXodK
 1mlD19YCU8rpOAifANyYBlhalUc6XZ3hkMEaeDTCxCNZLsN9XSzlbpsYfrvh7Xy8jhty
 3QHVghW0zSOczhbMV+5Ky+2o/jxE/h8Jl1ZltJkgjieEEw1bFB3IP/UE06NWaIjZYcdy
 n9n4yiRanJ5EteYkzGIgHJL/Lnp0Nj9r6EvGNZbUEoAftrB9rRdAifGCL6mQWbVMazbD
 frOg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qDdDat4r2d8oPSfITqjWD6+XqyGz/Uw2PFJ/Ua4rfg+p7iad7pSLlq9oVC4uvKq9qyLKdhDo7uWZDocfbsg==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywqh99ig+SPcN7YYOrak9OsVBC/SAkJkt0pNKa+taRZWFyo4XNd
 +Cd3ZCahjExUXlmeqMgjLG2vKQppiSX5HBuMtPnF22Q5twfDE6J5p7Mlw2/TfgFK4BDPbVpR2yz
 4fNw=
X-Gm-Gg: AfdE7ckpE0yh6q0LVJJ0wWquwCBnYrNoa+hoDiWp8IFqsqVxdFECyRC/aPQKsvqjifH
 dPWvcGjbMsZYZE73gVggqz4M0PZXBCUmUuLnloiMuvHYygVQjxgi3ADGODRJirkqj3GLziAuM1W
 kRsJ054e6eHb1HwX7JV0shDfKBSRoN64ZF/xBilddr40kKw7Wx2aN44lRn119OSLNmxif+egVkE
 ZcZsCjawM7Ei0uMB2r0qDxC2W65joRhFWSn4eJUehBfMuaqVuk50k7XtuHFlSEKAls/fBRnXREG
 f2cZ7aFb81WqhGqPPE2u22sMePVb6N8cYxYf3dR6/GV9jj9ZwyVKWaIzFdMvXgxaLOwftIZLsAf
 gp/ESVEa1vFKnmUBgc0rT3Ph5ybDPcqycQItex44RQuMF0/4jl7e8/LtFgqYdqkg2NXR5jDl2xt
 KLVCVbMOozh/Bomw8p4x5OAqEmupZERU1cCGfnFCpdikRScv04/2I=
X-Received: by 2002:a05:6102:3910:b0:631:ff40:22b2 with SMTP id
 ada2fe7eead31-7245d20641emr3297809137.2.1781720424525; 
 Wed, 17 Jun 2026 11:20:24 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-966a05a7da1sm7666793241.10.2026.06.17.11.20.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 11:20:23 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-6c28cd29891so48334137.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 Jun 2026 11:20:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9tepIvVmJowpAK/Hf2l+SBxfCQd54LKxRdboCbiwHVlKtPvfQ/AfUvngra7GkIlE2oLOzCQ5nMydZMV/QORA==@lists.sourceforge.net
X-Received: by 2002:a05:6102:4188:b0:632:3bd5:d572 with SMTP id
 ada2fe7eead31-7246d538eaemr3346738137.27.1781720422561; Wed, 17 Jun 2026
 11:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VoX2WmXpbpDAUDaO-H=TweXjAuP4Z5QZMQ1YqWZropnA@mail.gmail.com>
 <mbwhul34esbxkdbmlbjaquv5lgyzznn6pdapohry3lsiidbz6n@zucvm5os363q>
In-Reply-To: <mbwhul34esbxkdbmlbjaquv5lgyzznn6pdapohry3lsiidbz6n@zucvm5os363q>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jun 2026 11:20:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UB1ucX6nnxugTVLvi-jgpXOt6mMo0pOdigqqGt+rYYJQ@mail.gmail.com>
X-Gm-Features: AVVi8CfhQcuWVdBzMUNdYyXCFW2ldocvklF_iE0pogt73qvdgOQZChNyX6AmnqM
Message-ID: <CAD=FV=UB1ucX6nnxugTVLvi-jgpXOt6mMo0pOdigqqGt+rYYJQ@mail.gmail.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16, 2026 at 6:49 PM Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com> wrote: > > When kdb_setenv() fails to find a free
 slot in __env[], the function > returns KDB_ENVFULL without freeing th [...]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.41 listed in wl.mailspike.net]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wZusI-0007KY-05
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: fix memory leak in
 kdb_setenv() when environment is full
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
Cc: kgdb-bugreport@lists.sourceforge.net, danielt@kernel.org,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[kgdb-bugreport@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD3A169BEB7

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA2OjQ54oCvUE0gTmF2ZWVuIEt1bWFyIENoYXVk
aGFyeQo8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGtkYl9zZXRlbnYo
KSBmYWlscyB0byBmaW5kIGEgZnJlZSBzbG90IGluIF9fZW52W10sIHRoZSBmdW5jdGlvbgo+IHJl
dHVybnMgS0RCX0VOVkZVTEwgd2l0aG91dCBmcmVlaW5nIHRoZSBwcmV2aW91c2x5IGFsbG9jYXRl
ZCBzdHJpbmcKPiBidWZmZXIgJ2VwJywgbGVha2luZyBtZW1vcnkgb24gZXZlcnkgZmFpbGVkIGNh
bGwuCj4KPiBBZGQgdGhlIG1pc3Npbmcga2ZyZWUoZXApIGJlZm9yZSByZXR1cm5pbmcgS0RCX0VO
VkZVTEwuCj4KPiBGaXhlczogYTMwZDRmZjgxOTNlICgia2RiOiByZW1vdmUgdXNhZ2Ugb2Ygc3Rh
dGljIGVudmlyb25tZW50IGJ1ZmZlciIpCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIEt1bWFyIENo
YXVkaGFyeSA8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2tk
Yi9rZGJfbWFpbi5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKU2lu
Y2UgSSBhbHJlYWR5IHByb3ZpZGVkIG15IHRhZyBhbmQgdGhpcyBqdXN0IGltcGxlbWVudHMgdGhl
IG1pbm9yCnJldmlldyBmZWVkYmFjayBJIHByb3ZpZGVkLCB5b3UgcHJvYmFibHkgc2hvdWxkIGhh
dmUgY2FycmllZCBmb3J3YXJkCm15IHRhZy4gSW4gYW55IGNhc2U6CgpSZXZpZXdlZC1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlz
dApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
