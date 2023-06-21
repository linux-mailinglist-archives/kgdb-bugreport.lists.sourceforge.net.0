Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56058738546
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 21 Jun 2023 15:34:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qBxyB-0000T9-DX
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 21 Jun 2023 13:33:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mpe@ellerman.id.au>) id 1qBxy9-0000T3-W7
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Jun 2023 13:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zMmz8eNhn1LuA/bMCpwWPyDta4A4p5omDG9jWVnrIhA=; b=W0b/EMWHqz9TLmOm/F5QVkQ5Jn
 XyIQXYv5qxlS240qxqRJYN53tyg13s8HXO3KfskOL4z0urIBNiDMIqTQV4oGSFo/EZ+1Ov9u8V5Dj
 lGqM3Z2ia/QCbb0tKXgesO5QS2x4kUBYQl08M9Pp/ppBCZs1wtPIn0SxK3xKIqJkWpqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zMmz8eNhn1LuA/bMCpwWPyDta4A4p5omDG9jWVnrIhA=; b=eGkOh+RKyPiijwa4YVkTkysyVz
 UtL3cn8/4Jl2BFDr4+oDOnvkgfgpgFcMgzCp2wp1JGoYvZTqlwwP0hlRCf4Wr22n2PncyY8Z3H0/c
 yKNL89WMFMXRZ/b3hfqE36YanSdtnnrt5VB9eDzsNXFEdUjPaUR51wGLqZs5yLXC/3iY=;
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBxy0-00AfyS-9M for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Jun 2023 13:33:58 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QmP2R0Rwzz4wj7;
 Wed, 21 Jun 2023 23:08:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1687352912;
 bh=zMmz8eNhn1LuA/bMCpwWPyDta4A4p5omDG9jWVnrIhA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IELwl0a2CcWKtHQYpyrr7sFEKemIZwDa+P3WaQzNRjWOBtKHns7YRnhc4zJ61CtTe
 VtiNmWT/MSjxIcsMk0GFLElYIRQShuSOZETFrGgT4P/ghqCTLzPcLsUEq+LB9bTV+G
 ezXrX5eHiHuzHhgKJjcPGV4IhZoXJpyYiZGALWIB3CtTTFesoWwLyio6BWgifN4m/A
 Hc70Kn6muoGgmoZg4dh2jIQMqgSmiTjtGgniOT6wnQEbMbSiAeTGQxJDLRveCIyS/p
 RshmiYJ+tckcsHareuzZsBA7Thn4UtJZrdFKcOpxw0gcOY9CUtwyNJDvio492P5yOT
 3xClQ4DFwCJvg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton
 <akpm@linux-foundation.org>, Douglas Anderson <dianders@chromium.org>
In-Reply-To: <20230616150618.6073-7-pmladek@suse.com>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
Date: Wed, 21 Jun 2023 23:08:26 +1000
Message-ID: <871qi5otdh.fsf@mail.lhotse>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Petr Mladek <pmladek@suse.com> writes: > The HAVE_ prefix
 means that the code could be enabled. Add another > variable for
 HAVE_HARDLOCKUP_DETECTOR_ARCH
 without this prefix. > It will be set when it s [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qBxy0-00AfyS-9M
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
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

UGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+IHdyaXRlczoKPiBUaGUgSEFWRV8gcHJlZml4
IG1lYW5zIHRoYXQgdGhlIGNvZGUgY291bGQgYmUgZW5hYmxlZC4gQWRkIGFub3RoZXIKPiB2YXJp
YWJsZSBmb3IgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggd2l0aG91dCB0aGlzIHByZWZp
eC4KPiBJdCB3aWxsIGJlIHNldCB3aGVuIGl0IHNob3VsZCBiZSBidWlsdC4gSXQgd2lsbCBtYWtl
IGl0IGNvbXBhdGlibGUKPiB3aXRoIHRoZSBvdGhlciBoYXJkbG9ja3VwIGRldGVjdG9ycy4KPgo+
IFRoZSBjaGFuZ2UgYWxsb3dzIHRvIGNsZWFuIHVwIGRlcGVuZGVuY2llcyBvZiBQUENfV0FUQ0hE
T0cKPiBhbmQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgZGVmaW5pdGlvbnMgZm9yIHBv
d2VycGMuCj4KPiBBcyBhIHJlc3VsdCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRiBoYXMg
dGhlIHNhbWUgZGVwZW5kZW5jaWVzCj4gb24gYXJtLCB4ODYsIHBvd2VycGMgYXJjaGl0ZWN0dXJl
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgo+IFJl
dmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gLS0t
Cj4gIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgNSArKy0tLQo+ICBpbmNsdWRlL2xpbnV4L25taS5o
ICB8IDIgKy0KPiAgbGliL0tjb25maWcuZGVidWcgICAgfCA5ICsrKysrKysrKwo+ICAzIGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpTb21ldGhpbmcgaW4g
dGhpcyBwYXRjaCBpcyBicmVha2luZyB0aGUgcG93ZXJwYyBnNV9kZWZjb25maWcsIEkgZG9uJ3QK
aW1tZWRpYXRlbHkgc2VlIHdoYXQgdGhvdWdoLgoKLi4vYXJjaC9wb3dlcnBjL2tlcm5lbC9zdGFj
a3RyYWNlLmM6IEluIGZ1bmN0aW9uIOKAmGhhbmRsZV9iYWNrdHJhY2VfaXBp4oCZOgouLi9hcmNo
L3Bvd2VycGMva2VybmVsL3N0YWNrdHJhY2UuYzoxNzE6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIOKAmG5taV9jcHVfYmFja3RyYWNl4oCZIFstV2Vycm9yPWltcGxp
Y2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDE3MSB8ICAgICAgICAgbm1pX2NwdV9iYWNrdHJh
Y2UocmVncyk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgouLi9hcmNoL3Bvd2Vy
cGMva2VybmVsL3N0YWNrdHJhY2UuYzogSW4gZnVuY3Rpb24g4oCYYXJjaF90cmlnZ2VyX2NwdW1h
c2tfYmFja3RyYWNl4oCZOgouLi9hcmNoL3Bvd2VycGMva2VybmVsL3N0YWNrdHJhY2UuYzoyMjY6
OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmG5taV90cmlnZ2Vy
X2NwdW1hc2tfYmFja3RyYWNl4oCZOyBkaWQgeW91IG1lYW4g4oCYYXJjaF90cmlnZ2VyX2NwdW1h
c2tfYmFja3RyYWNl4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
ICAyMjYgfCAgICAgICAgIG5taV90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNlKG1hc2ssIGV4Y2x1
ZGVfc2VsZiwgcmFpc2VfYmFja3RyYWNlX2lwaSk7CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgYXJjaF90cmlnZ2VyX2NwdW1hc2tf
YmFja3RyYWNlCmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgoKY2hl
ZXJzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dk
Yi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1
Z3JlcG9ydAo=
