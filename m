Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1593F733733
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 19:12:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qACzd-0001G0-1O
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 17:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qACzb-0001Fu-Lo
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 17:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=; b=C/NfQ2hQ5L8dnGB3tTphr0gjnC
 HZzS/yTtl86mmBd1QC9lVzeEsqr/gzrIYtHDAAwvqCZZwWkkK+7L5IlrlDw+f8acjYljgjQmFWLJv
 gJO+tmFIvkSFBGomj6Y3XGLnQlhaMSNLXvUS5ecuDjAB19FuhsbFpusT7L2hxZXDuzRY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=; b=JLqmA4yV7sorjLp21TQJPniLB9
 3nlrWJ2T0/MhyR4IAwgIe2pbaH4awrUmlk1pVZKGy1zsq+5l9Z6mefB/qUSD2UWH0RgkjkHK9sIL2
 2ybyU10BWhygpMzCfV0kgI3h4Hx9brnGJENsq4HJ6k2QNwEl0HbtK4mrrKiNt4XsdiLg=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qACzZ-0002h5-3t for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 17:12:12 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-518b69d5b5dso1256003a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686935522; x=1689527522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=;
 b=l4b0Tp/EII5QsW60aatiF1HOo06x/X0x0H/6cOMIkR2mgHC24+WZKMOOERugHKQlXv
 zWGogsdy2d3XqexBo1Zos/ayAINxhXrrLbI/00s46ZlzwxwY5kP8lvz3yOGTmG3gC6ag
 Ctv/M5JGCSK2t1bLTPr9vqrzmXeI8+iw2MnSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686935522; x=1689527522;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=;
 b=lYPVRzqxAZcr9RS78GNbcYXHdD+Bg2ujBDl4k5adfTnxp9pb7CMYCVIDst2xUVHDv7
 Z8G92zgfSjKYlgwKoOSmwS4t2DTHUg8GAUWX27wCGkv6Gt1Z0IfvMXGq4zOa+L5upwgb
 JWUKKAE6HbziQSFA/V8If3blysByDBgyVT3SLynVVtpxjaKFbCxFOUKAMwtXgLWi1b26
 XQn+KnDVeVpfPQSuXDwSKOqCktNZeZinNkQWS+KZYuMswm0wB9J2WPGx9WQjdoyqlei0
 O8OWxjINWc6tGY6u1IeQIBBEpEYmcrErKdK3rKXQPLPxu7IVpBdBn+B7pznr+2P7Ooj6
 bz6w==
X-Gm-Message-State: AC+VfDzKk7l05p0qbcuAp9zzsYq49PZc7/JTNdgDHQsJM0gry8vGbFJe
 a0yhyADmLztftl8BJSpm3yMjtcd7qV87HSjOH0482lHf
X-Google-Smtp-Source: ACHHUZ5kjTAQnOaWr1h781FxeQ9CrH/Zcgmhbv7wCP9S+YcI//67Taf1dac74KsMJEtBiuOeN7nK9Q==
X-Received: by 2002:a17:906:6a21:b0:961:69a2:c8d6 with SMTP id
 qw33-20020a1709066a2100b0096169a2c8d6mr2335030ejc.69.1686934101191; 
 Fri, 16 Jun 2023 09:48:21 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 r26-20020a1709067fda00b0096a1ba4e0d1sm11007927ejs.32.2023.06.16.09.48.19
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 09:48:19 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-513ea2990b8so187a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 16 Jun 2023 09:48:19 -0700 (PDT)
X-Received: by 2002:a50:999d:0:b0:516:6453:1b76 with SMTP id
 m29-20020a50999d000000b0051664531b76mr240103edb.5.1686934098700; Fri, 16 Jun
 2023 09:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-5-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-5-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:48:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
Message-ID: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Fri, Jun 16, 2023 at 8:07 AM Petr Mladek <pmladek@suse.com>
    wrote: > > There are several hardlockup detector implementations and several
    Kconfig > values which allow selection and build of the pr [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.42 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.42 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qACzZ-0002h5-3t
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/6] watchdog/hardlockup: Make
 HAVE_NMI_WATCHDOG sparc64-specific
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
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA4OjA34oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIHNldmVyYWwgaGFyZGxvY2t1cCBkZXRl
Y3RvciBpbXBsZW1lbnRhdGlvbnMgYW5kIHNldmVyYWwgS2NvbmZpZwo+IHZhbHVlcyB3aGljaCBh
bGxvdyBzZWxlY3Rpb24gYW5kIGJ1aWxkIG9mIHRoZSBwcmVmZXJyZWQgb25lLgo+Cj4gQ09ORklH
X0hBUkRMT0NLVVBfREVURUNUT1Igd2FzIGludHJvZHVjZWQgYnkgdGhlIGNvbW1pdCAyMzYzN2Q0
NzdjMWY1M2FjYgo+ICgibG9ja3VwX2RldGVjdG9yOiBJbnRyb2R1Y2UgQ09ORklHX0hBUkRMT0NL
VVBfREVURUNUT1IiKSBpbiB2Mi42LjM2Lgo+IEl0IHdhcyBhIHByZXBhcmF0aW9uIHN0ZXAgZm9y
IGludHJvZHVjaW5nIHRoZSBuZXcgZ2VuZXJpYyBwZXJmIGhhcmRsb2NrdXAKPiBkZXRlY3Rvci4K
Pgo+IFRoZSBleGlzdGluZyBhcmNoLXNwZWNpZmljIHZhcmlhbnRzIGRpZCBub3Qgc3VwcG9ydCB0
aGUgdG8tYmUtY3JlYXRlZAo+IGdlbmVyaWMgYnVpbGQgY29uZmlndXJhdGlvbnMsIHN5c2N0bCBp
bnRlcmZhY2UsIGV0Yy4gVGhpcyBkaXN0aW5jdGlvbgo+IHdhcyBtYWRlIGV4cGxpY2l0IGJ5IHRo
ZSBjb21taXQgNGE3ODYzY2MyZWI1Zjk4ICgieDg2LCBubWlfd2F0Y2hkb2c6Cj4gUmVtb3ZlIEFS
Q0hfSEFTX05NSV9XQVRDSERPRyBhbmQgcmVseSBvbiBDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RP
UiIpCj4gaW4gdjIuNi4zOC4KPgo+IENPTkZJR19IQVZFX05NSV9XQVRDSERPRyB3YXMgaW50cm9k
dWNlZCBieSB0aGUgY29tbWl0IGQzMTRkNzRjNjk1Zjk2N2UxMDUKPiAoIm5taSB3YXRjaGRvZzog
ZG8gbm90IHVzZSBjcHAgc3ltYm9sIGluIEtjb25maWciKSBpbiB2My40LXJjMS4gSXQgcmVwbGFj
ZWQKPiB0aGUgYWJvdmUgbWVudGlvbmVkIEFSQ0hfSEFTX05NSV9XQVRDSERPRy4gQXQgdGhhdCB0
aW1lLCBpdCB3YXMgc3RpbGwgdXNlZAo+IGJ5IHRocmVlIGFyY2hpdGVjdHVyZXMsIG5hbWVseSBi
bGFja2ZpbiwgbW4xMDMwMCwgYW5kIHNwYXJjLgo+Cj4gVGhlIHN1cHBvcnQgZm9yIGJsYWNrZmlu
IGFuZCBtbjEwMzAwIGFyY2hpdGVjdHVyZXMgaGFzIGJlZW4gY29tcGxldGVseQo+IGRyb3BwZWQg
c29tZSB0aW1lIGFnby4gQW5kIHNwYXJjIGlzIHRoZSBvbmx5IGFyY2hpdGVjdHVyZSB3aXRoIHRo
ZSBoaXN0b3JpYwo+IE5NSSB3YXRjaGRvZyBhdCB0aGUgbW9tZW50Lgo+Cj4gQW5kIHRoZSBvbGQg
c3BhcmMgaW1wbGVtZW50YXRpb24gaXMgcmVhbGx5IHNwZWNpYWwuIEl0IGlzIGFsd2F5cyBidWls
dCBvbgo+IHNwYXJjNjQuIEl0IHVzZWQgdG8gYmUgYWx3YXlzIGVuYWJsZWQgdW50aWwgdGhlIGNv
bW1pdCA3YTVjOGI1N2NlYzkzMTk2Ygo+ICgic3BhcmM6IGltcGxlbWVudCB3YXRjaGRvZ19ubWlf
ZW5hYmxlIGFuZCB3YXRjaGRvZ19ubWlfZGlzYWJsZSIpIGFkZGVkCj4gaW4gdjQuMTAtcmMxLgo+
Cj4gVGhlcmUgYXJlIG9ubHkgZmV3IGxvY2F0aW9ucyB3aGVyZSB0aGUgc3BhcmM2NCBOTUkgd2F0
Y2hkb2cgaW50ZXJhY3RzCj4gd2l0aCB0aGUgZ2VuZXJpYyBoYXJkbG9ja3VwIGRldGVjdG9ycyBj
b2RlOgo+Cj4gICArIGltcGxlbWVudHMgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKSB3aGljaCBp
cyBjYWxsZWQgZnJvbSB0aGUgZ2VuZXJpYwo+ICAgICB0b3VjaF9ubWlfd2F0Y2hkb2coKQo+Cj4g
ICArIGltcGxlbWVudHMgd2F0Y2hkb2dfaGFyZGxvY2t1cF9lbmFibGUoKS9kaXNhYmxlKCkgdG8g
c3VwcG9ydAo+ICAgICAvcHJvYy9zeXMva2VybmVsL25taV93YXRjaGRvZwo+Cj4gICArIGlzIGFs
d2F5cyBwcmVmZXJyZWQgb3ZlciBvdGhlciBnZW5lcmljIHdhdGNoZG9ncywgc2VlCj4gICAgIENP
TkZJR19IQVJETE9DS1VQX0RFVEVDVE9SCj4KPiAgICsgaW5jbHVkZXMgYXNtL25taS5oIGludG8g
bGludXgvbm1pLmggYmVjYXVzZSBzb21lIHNwYXJjLXNwZWNpZmljCj4gICAgIGZ1bmN0aW9ucyBh
cmUgbmVlZGVkIGluIHNwYXJjLXNwZWNpZmljIGNvZGUgd2hpY2ggaW5jbHVkZXMKPiAgICAgb25s
eSBsaW51eC9ubWkuaC4KPgo+IFRoZSBzaXR1YXRpb24gYmVjYW1lIG1vcmUgY29tcGxpY2F0ZWQg
YWZ0ZXIgdGhlIGNvbW1pdCAwNWE0YTk1Mjc5MzExYzMKPiAoImtlcm5lbC93YXRjaGRvZzogc3Bs
aXQgdXAgY29uZmlnIG9wdGlvbnMiKSBhbmQgY29tbWl0IDIxMDQxODBhNTM2OThkZjUKPiAoInBv
d2VycGMvNjRzOiBpbXBsZW1lbnQgYXJjaC1zcGVjaWZpYyBoYXJkbG9ja3VwIHdhdGNoZG9nIikg
aW4gdjQuMTMtcmMxLgo+IFRoZXkgaW50cm9kdWNlZCBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1Jf
QVJDSC4gSXQgd2FzIHVzZWQgZm9yIHBvd2VycGMKPiBzcGVjaWZpYyBoYXJkbG9ja3VwIGRldGVj
dG9yLiBJdCB3YXMgY29tcGF0aWJsZSB3aXRoIHRoZSBwZXJmIG9uZQo+IHJlZ2FyZGluZyB0aGUg
Z2VuZXJhbCBib290LCBzeXNjdGwsIGFuZCBwcm9ncmFtbWluZyBpbnRlcmZhY2VzLgo+Cj4gSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggd2FzIGRlZmluZWQgYXMgYSBzdXBlcnNldCBvZgo+
IEhBVkVfTk1JX1dBVENIRE9HLiBJdCBtYWRlIHNvbWUgc2Vuc2UgYmVjYXVzZSBhbGwgYXJjaC1z
cGVjaWZpYwo+IGRldGVjdG9ycyBoYWQgc29tZSBjb21tb24gcmVxdWlyZW1lbnRzLCBuYW1lbHk6
Cj4KPiAgICsgaW1wbGVtZW50ZWQgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKQo+ICAgKyBpbmNs
dWRlZCBhc20vbm1pLmggaW50byBsaW51eC9ubWkuaAo+ICAgKyBkZWZpbmVkIHRoZSBkZWZhdWx0
IHZhbHVlIGZvciAvcHJvYy9zeXMva2VybmVsL25taV93YXRjaGRvZwo+Cj4gQnV0IGl0IGFjdHVh
bGx5IGhhcyBtYWRlIHRoaW5ncyBwcmV0dHkgY29tcGxpY2F0ZWQgd2hlbiB0aGUgZ2VuZXJpYwo+
IGJ1ZGR5IGhhcmRsb2NrdXAgZGV0ZWN0b3Igd2FzIGFkZGVkLiBCZWZvcmUgdGhlIGdlbmVyaWMg
cGVyZiBkZXRlY3Rvcgo+IHdhcyBuZXdlciBzdXBwb3J0ZWQgdG9nZXRoZXIgd2l0aCBhbiBhcmNo
LXNwZWNpZmljIG9uZS4gQnV0IHRoZSBidWRkeQo+IGRldGVjdG9yIGNvdWxkIHdvcmsgb24gYW55
IFNNUCBzeXN0ZW0uIEl0IG1lYW5zIHRoYXQgYW4gYXJjaGl0ZWN0dXJlCj4gY291bGQgc3VwcG9y
dCBib3RoIHRoZSBhcmNoLXNwZWNpZmljIGFuZCBidWRkeSBkZXRlY3Rvci4KPgo+IEFzIGEgcmVz
dWx0LCB0aGVyZSBhcmUgZmV3IHRyaWNreSBkZXBlbmRlbmNpZXMuIEZvciBleGFtcGxlLAo+IENP
TkZJR19IQVJETE9DS1VQX0RFVEVDVE9SIGRlcGVuZHMgb246Cj4KPiAgICgoSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX1BFUkYgfHwgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZKSAmJiAh
SEFWRV9OTUlfV0FUQ0hET0cpIHx8IEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNICj4KPiBU
aGUgcHJvYmxlbSBpcyB0aGF0IHRoZSB2ZXJ5IHNwZWNpYWwgc3BhcmMgaW1wbGVtZW50YXRpb24g
aXMgZGVmaW5lZCBhczoKPgo+ICAgSEFWRV9OTUlfV0FUQ0hET0cgJiYgIUhBVkVfSEFSRExPQ0tV
UF9ERVRFQ1RPUl9BUkNICj4KPiBBbm90aGVyIHByb2JsZW0gaXMgdGhhdCB0aGUgbWVhbmluZyBv
ZiBIQVZFX05NSV9XQVRDSERPRyBpcyBmYXIgZnJvbSBjbGVhcgo+IHdpdGhvdXQgcmVhZGluZyB1
bmRlcnN0YW5kaW5nIHRoZSBoaXN0b3J5Lgo+Cj4gTWFrZSB0aGUgbG9naWMgbGVzcyB0cmlja3kg
YW5kIG1vcmUgc2VsZi1leHBsYW5hdG9yeSBieSBtYWtpbmcKPiBIQVZFX05NSV9XQVRDSERPRyBz
cGVjaWZpYyBmb3IgdGhlIHNwYXJjNjQgaW1wbGVtZW50YXRpb24uIEFuZCByZW5hbWUgaXQgdG8K
PiBIQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfU1BBUkM2NC4KPgo+IE5vdGUgdGhhdCBIQVJETE9D
S1VQX0RFVEVDVE9SX1BSRUZFUl9CVUREWSwgSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGLAo+IGFu
ZCBIQVJETE9DS1VQX0RFVEVDVE9SX0JVRERZIG1heSBjb25mbGljdCBvbmx5IHdpdGgKPiBIQVZF
X0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSC4gVGhleSBkZXBlbmQgb24gSEFSRExPQ0tVUF9ERVRF
Q1RPUgo+IGFuZCBpdCBpcyBub3QgbG9uZ2VyIGVuYWJsZWQgd2hlbiBIQVZFX05NSV9XQVRDSERP
RyBpcyBzZXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNv
bT4KPgo+IHdhdGNoZG9nL3NwYXJjNjQ6IFJlbmFtZSBIQVZFX05NSV9XQVRDSERPRyB0byBIQVZF
X0hBUkRMT0NLVVBfV0FUQ0hET0dfU1BBUkM2NAo+Cj4gVGhlIGNvbmZpZ3VyYXRpb24gdmFyaWFi
bGUgSEFWRV9OTUlfV0FUQ0hET0cgaGFzIGEgZ2VuZXJpYyBuYW1lIGJ1dAo+IGl0IGlzIHNlbGVj
dGVkIG9ubHkgZm9yIFNQQVJDNjQuCj4KPiBJdCBzaG91bGQgX25vdF8gYmUgdXNlZCBpbiBnZW5l
cmFsIGJlY2F1c2UgaXQgaXMgbm90IGludGVncmF0ZWQgd2l0aAo+IHRoZSBvdGhlciBoYXJkbG9j
a3VwIGRldGVjdG9ycy4gTmFtZWx5LCBpdCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBoYXJkbG9ja3Vw
Cj4gc3BlY2lmaWMgY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMgYW5kIHN5c3RjbCBpbnRlcmZhY2Uu
IEluc3RlYWQsIGl0IGlzCj4gZW5hYmxlZC9kaXNhYmxlZCB0b2dldGhlciB3aXRoIHRoZSBzb2Z0
bG9ja3VwIGRldGVjdG9yIGJ5IHRoZSBnbG9iYWwKPiAid2F0Y2hkb2ciIHN5c2N0bC4KPgo+IFJl
bmFtZSBpdCB0byBIQVZFX0hBUkRMT0NLVVBfV0FUQ0hET0dfU1BBUkM2NCB0byBtYWtlIHRoZSBz
cGVjaWFsCj4gYmVoYXZpb3IgbW9yZSBjbGVhci4KPgo+IEFsc28gdGhlIHZhcmlhYmxlIGlzIHNl
dCBvbmx5IG9uIHNwYXJjNjQuIE1vdmUgdGhlIGRlZmluaXRpb24KPiBmcm9tIGFyY2gvS2NvbmZp
ZyB0byBhcmNoL3NwYXJjL0tjb25maWcuZGVidWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIE1s
YWRlayA8cG1sYWRla0BzdXNlLmNvbT4KCkkgdGhpbmsgeW91IGdvb2ZlZCB1cCB3aGVuIHNxdWFz
aGluZyB0aGUgcGF0Y2hlcy4gWW91J3ZlIG5vdyBnb3QgYQpzZWNvbmQgcGF0Y2ggc3ViamVjdCBh
ZnRlciB5b3VyIGZpcnN0IFNpZ25lZC1vZmYtYnkgYW5kIHRoZW4gYSBzZWNvbmQKU2lnbmVkLW9m
Zi1ieS4uLiBJIGFzc3VtZSBldmVyeXRoaW5nIGFmdGVyIHRoZSBmaXJzdCBTaWduZWQtb2ZmLWJ5
CnNob3VsZCBiZSBkcm9wcGVkPwoKT3RoZXIgdGhhbiB0aGF0OgoKUmV2aWV3ZWQtYnk6IERvdWds
YXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QK
S2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
