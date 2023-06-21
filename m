Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14E73933B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 22 Jun 2023 01:50:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qC7av-0001wb-Iu
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 21 Jun 2023 23:50:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1qC7at-0001wV-B7
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Jun 2023 23:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=; b=mwAw9Y++9zBB3D23ryDqAK2JGa
 aBVM7VGhN0C2Ea25IO2tyVXELyxLMW4hqm5Vaz+Tupbfyoxyx5/+TjtyXtiirFxy6vqRX0aQAhX8k
 Fd/O5tn7o0coZt/L3MWTjDWw9JpaGv9DoOEHtsd7CxT1n0zRSQeuqM3A4t9ETma8TgLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=; b=R/E+LskwuYPPHXornJJcMH4j1h
 4AetYS5vhWGP/4q/Oqxt94MEQ9MG8q9yNI21eOKyl9cabPlc0MwChylpO0y2A12LBOsE6MVUofh0d
 Kvk7Mjm1nLDX3HUABdW/kjJwFt8jMN8VGorxGdjqGf9AqRL8Q/E528gbNsAXbfDCP/TI=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qC7as-00B2BU-AT for kgdb-bugreport@lists.sourceforge.net;
 Wed, 21 Jun 2023 23:50:35 +0000
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b4619ef079so80968711fa.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 21 Jun 2023 16:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687391426; x=1689983426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=;
 b=mF3PV3wraNhPN1ogQrmMsznOwTZmTFvJ2q+ZLR4/FhwOrxaCO0IwuUmcaTs7yz5Vsa
 Q7oBTpcwl/Ys94LHOXJPGrMA4YClM1PmDjlG3u6A/wB65WubRlpensLqUYmXupl41ktF
 0VK/sfjX9YQ8vS7e6+vUJg+F2redXCz0ZNktY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687391426; x=1689983426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=;
 b=HnyAZj7EiWvYvsTxDI4079oOHk/3qI50eliPK3ttRJjmZE9EZhL6bq+7prLgOl49Xw
 5tmY79gTtmU5TImYVmQe4C7vXwkHRF01zJHv0NtYvbPEntQEtBLp5OtJ0P0f3+PCJKlI
 apct8viL+gza3j0Jt7z/5qlUbYkunbjQTFVUHysx1upkhwGpwsPIxObDxlJEhrYH0SqG
 i1P/Sel0/ZN9U2phw1niixu8P500AAJWwhFDJSf5G92n8ZIBE4IB8B1X2OY71HDSjytc
 QEQ6DJf3O0yANXf7FMHYXO+XONedoHIWBUvmnlIcBVN62CnDIE32DMQXL9vGlY1+//Wo
 0LZA==
X-Gm-Message-State: AC+VfDyMIYL4ntLLDdEw87FN23r7E8Sa+5cHoYZaVDk69xuVJanC58df
 6bqTPLyM1YSN3bWHEWBzhPIc6xyXdtJ3iUmgUlEsW+Pk
X-Google-Smtp-Source: ACHHUZ6LbSbdCbe5KzRKxSml2amFzbihcER8/NHyGoWjA3WAc1x7KnoWBkZQHTjsY+NzOs3LjUQicg==
X-Received: by 2002:a2e:9d44:0:b0:2b4:738a:c32c with SMTP id
 y4-20020a2e9d44000000b002b4738ac32cmr7134777ljj.4.1687391426423; 
 Wed, 21 Jun 2023 16:50:26 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com.
 [209.85.208.45]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm3729079ejj.49.2023.06.21.16.50.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 16:50:25 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-51bcf75c4acso3052a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 21 Jun 2023 16:50:24 -0700 (PDT)
X-Received: by 2002:a50:c35e:0:b0:519:7d2:e256 with SMTP id
 q30-20020a50c35e000000b0051907d2e256mr4978edb.0.1687391424164; Wed, 21 Jun
 2023 16:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-7-pmladek@suse.com>
 <871qi5otdh.fsf@mail.lhotse>
In-Reply-To: <871qi5otdh.fsf@mail.lhotse>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 Jun 2023 16:50:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgC0JkjMZjx0z-gt0iXp-UJr87nutB9xWKhB6qMzWWNg@mail.gmail.com>
Message-ID: <CAD=FV=XgC0JkjMZjx0z-gt0iXp-UJr87nutB9xWKhB6qMzWWNg@mail.gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 21, 2023 at 6:08 AM Michael Ellerman <mpe@ellerman.id.au>
    wrote: > > Petr Mladek <pmladek@suse.com> writes: > > The HAVE_ prefix means
    that the code could be enabled. Add another > > var [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qC7as-00B2BU-AT
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCA2OjA44oCvQU0gTWljaGFlbCBFbGxlcm1hbiA8
bXBlQGVsbGVybWFuLmlkLmF1PiB3cm90ZToKPgo+IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2Uu
Y29tPiB3cml0ZXM6Cj4gPiBUaGUgSEFWRV8gcHJlZml4IG1lYW5zIHRoYXQgdGhlIGNvZGUgY291
bGQgYmUgZW5hYmxlZC4gQWRkIGFub3RoZXIKPiA+IHZhcmlhYmxlIGZvciBIQVZFX0hBUkRMT0NL
VVBfREVURUNUT1JfQVJDSCB3aXRob3V0IHRoaXMgcHJlZml4Lgo+ID4gSXQgd2lsbCBiZSBzZXQg
d2hlbiBpdCBzaG91bGQgYmUgYnVpbHQuIEl0IHdpbGwgbWFrZSBpdCBjb21wYXRpYmxlCj4gPiB3
aXRoIHRoZSBvdGhlciBoYXJkbG9ja3VwIGRldGVjdG9ycy4KPiA+Cj4gPiBUaGUgY2hhbmdlIGFs
bG93cyB0byBjbGVhbiB1cCBkZXBlbmRlbmNpZXMgb2YgUFBDX1dBVENIRE9HCj4gPiBhbmQgSEFW
RV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgZGVmaW5pdGlvbnMgZm9yIHBvd2VycGMuCj4gPgo+
ID4gQXMgYSByZXN1bHQgSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX1BFUkYgaGFzIHRoZSBzYW1l
IGRlcGVuZGVuY2llcwo+ID4gb24gYXJtLCB4ODYsIHBvd2VycGMgYXJjaGl0ZWN0dXJlcy4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIE1sYWRlayA8cG1sYWRla0BzdXNlLmNvbT4KPiA+IFJl
dmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Bvd2VycGMvS2NvbmZpZyB8IDUgKystLS0KPiA+ICBpbmNsdWRlL2xpbnV4
L25taS5oICB8IDIgKy0KPiA+ICBsaWIvS2NvbmZpZy5kZWJ1ZyAgICB8IDkgKysrKysrKysrCj4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
U29tZXRoaW5nIGluIHRoaXMgcGF0Y2ggaXMgYnJlYWtpbmcgdGhlIHBvd2VycGMgZzVfZGVmY29u
ZmlnLCBJIGRvbid0Cj4gaW1tZWRpYXRlbHkgc2VlIHdoYXQgdGhvdWdoLgo+Cj4gLi4vYXJjaC9w
b3dlcnBjL2tlcm5lbC9zdGFja3RyYWNlLmM6IEluIGZ1bmN0aW9uIOKAmGhhbmRsZV9iYWNrdHJh
Y2VfaXBp4oCZOgo+IC4uL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3RhY2t0cmFjZS5jOjE3MTo5OiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbm1pX2NwdV9iYWNrdHJh
Y2XigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAxNzEgfCAg
ICAgICAgIG5taV9jcHVfYmFja3RyYWNlKHJlZ3MpOwo+ICAgICAgIHwgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fgo+IC4uL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3RhY2t0cmFjZS5jOiBJbiBmdW5j
dGlvbiDigJhhcmNoX3RyaWdnZXJfY3B1bWFza19iYWNrdHJhY2XigJk6Cj4gLi4vYXJjaC9wb3dl
cnBjL2tlcm5lbC9zdGFja3RyYWNlLmM6MjI2Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiDigJhubWlfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZeKAmTsgZGlkIHlv
dSBtZWFuIOKAmGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZeKAmT8gWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAyMjYgfCAgICAgICAgIG5taV90cmlnZ2Vy
X2NwdW1hc2tfYmFja3RyYWNlKG1hc2ssIGV4Y2x1ZGVfc2VsZiwgcmFpc2VfYmFja3RyYWNlX2lw
aSk7Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gICAg
ICAgfCAgICAgICAgIGFyY2hfdHJpZ2dlcl9jcHVtYXNrX2JhY2t0cmFjZQo+IGNjMTogYWxsIHdh
cm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpZZWFoLCBJIGNhbiByZXByb2R1Y2UgdGhh
dC4KClRoZSBwcm9ibGVtIGlzIHRoYXQgYmVmb3JlICR7U1VCSkVDVH0gcGF0Y2ggImluY2x1ZGUv
bGludXgvbm1pLmgiCndvdWxkIGluY2x1ZGUgPGFzbS9ubWkuaD4uIE5vdyBpdCB3b24ndC4KClRo
ZXJlIGFyZSBhIHRvbiBvZiBkaWZmZXJlbnQgd2F5cyB0byBmaXggdGhpcywgYnV0IEkgdGhpbmsg
dGhlIG9uZQp0aGF0IG1ha2VzIHNlbnNlIGlzIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCBvdGhlciBh
cmNoaXRlY3R1cmVzIGFuZCBtb3ZlCnRoZSAiYXJjaF90cmlnZ2VyX2NwdW1hc2tfYmFja3RyYWNl
IiBkZWZpbml0aW9ucyB0byBhc20vaXJxLmguCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjMwNjIxMTY0ODA5LjEuSWNlNjcxMjY4NTc1MDY3MTI1NTkwNzhlN2RlMjZkMzJkMjZlNjQ2MzFA
Y2hhbmdlaWQKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
