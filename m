Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l/YTCELMMWrgqAUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:20:50 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 316686958D9
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 00:20:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ljDab8ww;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MuRjR9g2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=PO2CRvbu;
	dkim=fail ("body hash did not verify") header.d=chromium.org header.s=google header.b=lP+msApu;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=chromium.org (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4qPEN7RudcE/2RKBJCjJ1zhzowyl4a97GbDypAf5eE=; b=ljDab8wwa4GakFyoTQJquLV0xP
	gT0chW0X2gtKCTZPUJdGO4u7fgwMnnv8y3ZP3H1MifdNgOcV11yoHWB0Ojlp5nIe0BouPb/+7CrIn
	omm6FRQqFT4PL6QcYDflcvOf8dp8QYi13dyoGz1Q+IpDVujXCDPrvW2+0I3jE1RwC0Rg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZc9H-0001z0-0O
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Jun 2026 22:20:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1wZc9E-0001ys-6m
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5cFArtGstkdefbhoNJtQnVnR8LkNLmJzm3CdRJ9tKvk=; b=MuRjR9g2LT13HA6GYEdyS6poRM
 lwEy6nB7gNb/IlEfPe44dNYOtHebx9/bIKYEn/H1ae75cg74DkCi3Ss7BPWw5brXrSv1CFmXZicfB
 wjL7qoMrph3kPSubOebi3FVxeALHLEXbf1Xzx3Z8709kypfTckNO6RRW8ranE1puW4lM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5cFArtGstkdefbhoNJtQnVnR8LkNLmJzm3CdRJ9tKvk=; b=PO2CRvbuWpWjjnN0Fwya+59YC0
 S450S2ATujPa2N4VPpYdiAK3cux7/95P/1bRzZy3llnshuZjT7VvbJqDaoASADjKAd8m1BEDGvkpt
 YlKoFlC7FWAIZ7CMUgaL5zxFqE5yDJZ/zEfBJI2rRuFEg6x/+0RwMFtMTOuHxsNXZOHY=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wZc9C-00019e-7v for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Jun 2026 22:20:44 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-5177b9a02bdso67584751cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1781648432; x=1782253232;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cFArtGstkdefbhoNJtQnVnR8LkNLmJzm3CdRJ9tKvk=;
 b=lP+msApu+e23+U5/anDOaCp2sWD9pNM64p6FuF2bXxQDd7hwThFmb5T6oahU6ug9Ym
 vhfeXUbKS92N5EQHwPSZRWW/g6HSwuNgtZcb40om70nBhhUvkuBama/X3tZdjhWsqcBf
 G40JgdIPGLv21+WcjfAefV7B6WTJ4arhbkdt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781648432; x=1782253232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5cFArtGstkdefbhoNJtQnVnR8LkNLmJzm3CdRJ9tKvk=;
 b=Jt00bimLNILAPVPpBiHhMD+fiUUoO9P5/ScTSR9czQs8DF0wv86Zgji6uEk9XsKTZe
 pp6v5WI2HkFhMg8+ZMfxOzfHhqRMN0X52AyqAiqoI7N8BBiO2Lng/lSKJ/2ebScF9OIS
 Flsw1r6teiHAyPg/8zy9Sjpu5CF9puwndeZD4S98SdaT48mNRndZFjM1YFkIcIffOmuo
 j6jU7dLFM09ICJkN5o1gCeOdt7xXOA7+I3fbKS3aBzaCBDCmaKcNlZ4HNIMQr2MOeKdO
 UGSJsbMbyErqr/i7D6B60pGkKEdboPY4CZt1Xw0m4r2y6khGn6HhqHYYsWOsGc1TxwEn
 kR2Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9NCBRGY1pE1/WoNTMm5S4+RRQCh+b2f15PEDdKvmm3ghZT+A3C0pJ6YbfpToHYb0aH/BckeXda+tN8Spk1ZQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwoavmCJsIAXeC8UL9s51R4Xd8ae4tPuS/1wNxT9Empbun9KvFn
 5aNbNZf+N0zERdekDIRk6pnjP5S2wGTOPX0jOifM/12a/IPQht0f8eEmTawATrP2bhFkC71iCtQ
 ZaSw=
X-Gm-Gg: Acq92OG1iu/0JdS6gPQDPWkf5tJojWldbE1gGphGYEIGV6cSeSYtiIZiunvzTpTQnDO
 9Qb48ukHQc3BnWGSJRKqja4J4aD3wKH7NHvWf5xUjhaIvVFCNw/6mrJYEyeij1/UOxtETalq3Zc
 RSxhP7Nud6WaUWQYDeZVXg1H+Td3ePeDIc/cpDsGVDZ0Rt2I2zOYZkrgmJcFwo3zdbPp1HtJRd7
 vrv5Ppu0/MeY9iuyzbLMQEZyMqbEtVu2bU9Wt7Kn8vgrNaLo59XVJk/MFLSH9K57Ik0Z5RJkZau
 3Ch7p4TIPSLqmK87lmrgs69YtsyytJP0HebcJ1rz+h+qzEi6X7bmsZ5fC2BhPRSdVrCnc3TOmDB
 5dQfnpZKbRPsOYZzEQQvgr50fbF/ABLTqwYQsmFcNWVGpp31vukeLBD+QjSvM90RZNm5D0QbpXo
 GTYl3mLYEyHeSw8y+0Eqgqgr5ehPwKAFG1RqoN/+GL3kp+HjB2nTYefb+hZXnQxw==
X-Received: by 2002:a05:6102:3f8f:b0:6ac:c0ab:5dc7 with SMTP id
 ada2fe7eead31-7245d52de15mr816398137.5.1781646533318; 
 Tue, 16 Jun 2026 14:48:53 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-72481eb4566sm671841137.0.2026.06.16.14.48.50
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 14:48:52 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-9667fe10d29so909511241.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Jun 2026 14:48:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9y4aJhsKC6n6DdAppfpUBii6SV0REGaD+0lRKwpt4WNlV1AUn4iQLXONsCA0ZaHdeJ/c1ZuPTg1Csh1jPLZQ==@lists.sourceforge.net
X-Received: by 2002:a05:6102:c4d:b0:632:29a5:2b27 with SMTP id
 ada2fe7eead31-7245d4294afmr751103137.3.1781646529927; Tue, 16 Jun 2026
 14:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <uddjzmr3oqbf2ly5iyx4ajomreub7firbrzwinhj35ppix6jlo@tt6ejkxmk4tj>
In-Reply-To: <uddjzmr3oqbf2ly5iyx4ajomreub7firbrzwinhj35ppix6jlo@tt6ejkxmk4tj>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Jun 2026 14:48:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9pxD4QVdWVND5ixtb3+52sEYi+crkkbKBA628xzxEvg@mail.gmail.com>
X-Gm-Features: AVVi8CcGNSoN8CCm2FOZNXAMWIaDLwe5-5RMbO4W4LkbB95q1ufYiIt1RJLR4NE
Message-ID: <CAD=FV=X9pxD4QVdWVND5ixtb3+52sEYi+crkkbKBA628xzxEvg@mail.gmail.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Tue, Jun 16, 2026 at 9:43 AM Naveen Kumar Chaudhary
 <naveen.osdev@gmail.com> wrote: > > Remove the dead 'return 1' after panic()
 in kgdb_reenter_check(). > panic() is marked __noreturn so the subse [...]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.171 listed in wl.mailspike.net]
X-Headers-End: 1wZc9C-00019e-7v
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: remove unreachable return in
 kgdb_reenter_check()
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[chromium.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:kgdb-bugreport@lists.sourceforge.net,m:danielt@kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,kgdb-bugreport-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,chromium.org:s=google];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,chromium.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 316686958D9

SGksCgpPbiBUdWUsIEp1biAxNiwgMjAyNiBhdCA5OjQz4oCvQU0gTmF2ZWVuIEt1bWFyIENoYXVk
aGFyeQo8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgdGhlIGRlYWQg
J3JldHVybiAxJyBhZnRlciBwYW5pYygpIGluIGtnZGJfcmVlbnRlcl9jaGVjaygpLgo+IHBhbmlj
KCkgaXMgbWFya2VkIF9fbm9yZXR1cm4gc28gdGhlIHN1YnNlcXVlbnQgcmV0dXJuIHN0YXRlbWVu
dCBjYW4KPiBuZXZlciBleGVjdXRlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIEt1bWFyIENo
YXVkaGFyeSA8bmF2ZWVuLm9zZGV2QGdtYWlsLmNvbT4KPiAtLS0KPiAga2VybmVsL2RlYnVnL2Rl
YnVnX2NvcmUuYyB8IDIgLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2RlYnVnX2NvcmUuYyBiL2tlcm5lbC9kZWJ1Zy9kZWJ1
Z19jb3JlLmMKPiBpbmRleCBiMjc2NTA0YzFjNmIuLjFjOWJjNzA1YzMyYyAxMDA2NDQKPiAtLS0g
YS9rZXJuZWwvZGVidWcvZGVidWdfY29yZS5jCj4gKysrIGIva2VybmVsL2RlYnVnL2RlYnVnX2Nv
cmUuYwo+IEBAIC01NTUsOCArNTU1LDYgQEAgc3RhdGljIGludCBrZ2RiX3JlZW50ZXJfY2hlY2so
c3RydWN0IGtnZGJfc3RhdGUgKmtzKQo+ICAjZW5kaWYKPiAgICAgICAgIGR1bXBfc3RhY2soKTsK
PiAgICAgICAgIHBhbmljKCJSZWN1cnNpdmUgZW50cnkgdG8gZGVidWdnZXIiKTsKPiAtCj4gLSAg
ICAgICByZXR1cm4gMTsKCkkgZ3Vlc3M/IEknbSBub3QgdGVycmlibHkgdXBzZXQgb3IgY29uZnVz
ZWQgYnkgdGhpcyBleHRyYW5lb3VzCiJyZXR1cm4iLCBidXQgSSBndWVzcyBpdCdzIGZpbmUgdG8g
cmVtb3ZlIGl0Li4uCgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
a2dkYi1idWdyZXBvcnQK
