Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD76FE1A2
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 May 2023 17:36:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwls6-0006QZ-5B
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 May 2023 15:36:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pwls3-0006QT-C3
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 15:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=; b=SXmXrmh/BlHr8XOG2e252xvJ0H
 4ijhOZLGN8FQDGUFMZ7q5EjmqUufOOoqKOYcXq2+5RlGCz6FCqoglVLg9qnSK7epch+EgEh0mVAou
 emC26EfCbMekLxC9ywCu1UK2c3mE9gaCTBqgV9goUNkZvdksbS2m3vx/4cIr241bur/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=; b=U4j9VFN/Ry6LvXxD2xD+dr4KCa
 Xx/kWD/NKVM/hx9E8ZGjitOku2F7zbZYRThksL6Z8VF/+T9zj85X6g3NQMc+D37kOwSIb+GjDHyNO
 Jb92Yl9dxoPPx7Rs1jIqzMMrU6hApUUhLeNkSVJD+j5Zwih/F3nL5xMTUFUBBNZRYze0=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pwlry-002L3S-T7 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 15:36:50 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso13198847a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 10 May 2023 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683733000; x=1686325000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
 b=GXeRjGFj5O1yanfM18qqBWp3eRsCAJwwK/HSeNsMZFTIH/shB+M+4YiBBf5+gVPCS9
 fNNLU0aiA0wyYP+eTpdk9Qj3wqJ5V+t5zF/6ohBqzgfCD+i1OExp+21NfVTyHjPHqu3k
 Zg5CXOw+1LTLiqLqHZ3QWz+RgAIv610XztN7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733000; x=1686325000;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzhn1S4hfKcOd1E/ek0bvXDc8iMvqfYzj4agdzIw7zg=;
 b=WmRgMPgVcnfSHA3Zw1SIIMs1Qo+TIkgbEN2jSEXbKfNFR2nmtC/Fl68r0SMbSpVE8Q
 31He79TSlKjL4f9OAj+R4B1rogyKmRJ4l7awGnxqraqQffjxH8zjN8CiUYYmO+2lEQAT
 2ex5d56RswGzGg4N+B3Kv6KAlrqGx2en+tWmSlW7F2m8wjFR6Hq1Tp9yvPfVRXdVH1bM
 C52LvUXB1q74ZXAOz2uzaoN8bE/DSPHoYwf9ios5pCjNN8krZrfRiMBfLIF17SFPlOFJ
 ltKJKNqnNpTjZqOxPi15lyf1x0wtSTvz9tR1yRHBz3yfSj9WPq7Lwl/3+4k14FoKFrvi
 E+JQ==
X-Gm-Message-State: AC+VfDwvXv+qLRN7VzXeB/tEymRwMmgnvHMFomk5IE8W1XLiHVwo6GWP
 m2dLyEZ4Nb03EYrpJYoragxE+taVU0fD98YYLdXMVA==
X-Google-Smtp-Source: ACHHUZ7vt4PaVmbSklf8Tyf0yKWYf/g7IqdW/EY49T0F4qGG7tAehjF6FqWBmeoZbAwTxHdpBxFD+g==
X-Received: by 2002:a17:907:74c:b0:953:37eb:7727 with SMTP id
 xc12-20020a170907074c00b0095337eb7727mr18064144ejb.43.1683733000205; 
 Wed, 10 May 2023 08:36:40 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 lv4-20020a170906bc8400b00966293c06e9sm2768128ejb.126.2023.05.10.08.36.39
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:36:39 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3f423c17bafso128325e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 10 May 2023 08:36:39 -0700 (PDT)
X-Received: by 2002:a05:600c:600f:b0:3f1:6fe9:4a98 with SMTP id
 az15-20020a05600c600f00b003f16fe94a98mr178073wmb.5.1683732511119; Wed, 10 May
 2023 08:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 May 2023 08:28:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
Message-ID: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > This is an attempt to resurrect Sumit's old patch series [1] that
    > allowed us to use the arm64 pseudo-NMI to get [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.41 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pwlry-002L3S-T7
Subject: Re: [Kgdb-bugreport] [PATCH v8 00/10] arm64: Add framework to turn
 an IPI as NMI
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Ard Biesheuvel <ardb@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Pierre Gondois <Pierre.Gondois@arm.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ito-yuichi@fujitsu.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFRoaXMgaXMgYW4gYXR0ZW1wdCB0byBy
ZXN1cnJlY3QgU3VtaXQncyBvbGQgcGF0Y2ggc2VyaWVzIFsxXSB0aGF0Cj4gYWxsb3dlZCB1cyB0
byB1c2UgdGhlIGFybTY0IHBzZXVkby1OTUkgdG8gZ2V0IGJhY2t0cmFjZXMgb2YgQ1BVcyBhbmQK
PiBhbHNvIHRvIHJvdW5kIHVwIENQVXMgaW4ga2RiL2tnZGIuIFRoZSBsYXN0IHBvc3QgZnJvbSBT
dW1pdCB0aGF0IEkKPiBjb3VsZCBmaW5kIHdhcyB2Nywgc28gSSBjYWxsZWQgdGhpcyBzZXJpZXMg
djguIEkgaGF2ZW4ndCBjb3BpZWQgYWxsIG9mCj4gaGlzIG9sZCBjaGFuZ2Vsb25ncyBoZXJlLCBi
dXQgeW91IGNhbiBmaW5kIHRoZW0gZnJvbSB0aGUgbGluay4KPgo+IFNpbmNlIHY3LCBJIGhhdmU6
Cj4gKiBBZGRyZXNzZWQgdGhlIHNtYWxsIGFtb3VudCBvZiBmZWVkYmFjayB0aGF0IHdhcyB0aGVy
ZSBmb3IgdjcuCj4gKiBSZWJhc2VkLgo+ICogQWRkZWQgYSBuZXcgcGF0Y2ggdGhhdCBwcmV2ZW50
cyB1cyBmcm9tIHNwYW1taW5nIHRoZSBsb2dzIHdpdGggaWRsZQo+ICAgdGFza3MuCj4gKiBBZGRl
ZCBhbiBleHRyYSBwYXRjaCB0byBncmFjZWZ1bGx5IGZhbGwgYmFjayB0byByZWd1bGFyIElQSXMg
aWYKPiAgIHBzZXVkby1OTUlzIGFyZW4ndCB0aGVyZS4KPgo+IFNpbmNlIHRoZXJlIGFwcGVhciB0
byBiZSBhIGZldyBkaWZmZXJlbnQgcGF0Y2hlcyBzZXJpZXMgcmVsYXRlZCB0bwo+IGJlaW5nIGFi
bGUgdG8gdXNlIE5NSXMgdG8gZ2V0IHN0YWNrIHRyYWNlcyBvZiBjcmFzaGVkIHN5c3RlbXMsIGxl
dCBtZQo+IHRyeSB0byBvcmdhbml6ZSB0aGVtIHRvIHRoZSBiZXN0IG9mIG15IHVuZGVyc3RhbmRp
bmc6Cj4KPiBhKSBUaGlzIHNlcmllcy4gT24gaXRzIG93biwgYSkgd2lsbCAoYW1vbmcgb3RoZXIg
dGhpbmdzKSBlbmFibGUgc3RhY2sKPiAgICB0cmFjZXMgb2YgYWxsIHJ1bm5pbmcgcHJvY2Vzc2Vz
IHdpdGggdGhlIHNvZnQgbG9ja3VwIGRldGVjdG9yIGlmCj4gICAgeW91J3ZlIGVuYWJsZWQgdGhl
IHN5c2N0bCAia2VybmVsLnNvZnRsb2NrdXBfYWxsX2NwdV9iYWNrdHJhY2UiLiBPbgo+ICAgIGl0
cyBvd24sIGEpIGRvZXNuJ3QgZ2l2ZSBhIGhhcmQgbG9ja3VwIGRldGVjdG9yLgo+Cj4gYikgQSBk
aWZmZXJlbnQgcmVjZW50bHktcG9zdGVkIHNlcmllcyBbMl0gdGhhdCBhZGRzIGEgaGFyZCBsb2Nr
dXAKPiAgICBkZXRlY3RvciBiYXNlZCBvbiBwZXJmLiBPbiBpdHMgb3duLCBiKSBnaXZlcyBhIHN0
YWNrIGNyYXdsIG9mIHRoZQo+ICAgIGxvY2tlZCB1cCBDUFUgYnV0IG5vIHN0YWNrIGNyYXdscyBv
ZiBvdGhlciBDUFVzIChldmVuIGlmIHRoZXkncmUKPiAgICBsb2NrZWQgdG9vKS4gVG9nZXRoZXIg
d2l0aCBhKSArIGIpIHdlIGdldCBldmVyeXRoaW5nIChmdWxsIGxvY2t1cAo+ICAgIGRldGVjdCwg
ZnVsbCBhYmlsaXR5IHRvIGdldCBzdGFjayBjcmF3bHMpLgo+Cj4gYykgVGhlIG9sZCBBbmRyb2lk
ICJidWRkeSIgaGFyZCBsb2NrdXAgZGV0ZWN0b3IgWzNdIHRoYXQgSSdtCj4gICAgY29uc2lkZXJp
bmcgdHJ5aW5nIHRvIHVwc3RyZWFtLiBJZiBiKSBsYW5kcyB0aGVuIEkgYmVsaWV2ZSBjKSB3b3Vs
ZAo+ICAgIGJlIHJlZHVuZGFudCAoYXQgbGVhc3QgZm9yIGFybTY0KS4gYykgb24gaXRzIG93biBp
cyByZWFsbHkgb25seQo+ICAgIHVzZWZ1bCBvbiBhcm02NCBmb3IgcGxhdGZvcm1zIHRoYXQgY2Fu
IHByaW50IENQVV9EQkdQQ1NSIHNvbWVob3cKPiAgICAoc2VlIFs0XSkuIGEpICsgYykgaXMgcm91
Z2hseSBhcyBnb29kIGFzIGEpICsgYikuCj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtYXJtLWtlcm5lbC8xNjA0MzE3NDg3LTE0NTQzLTEtZ2l0LXNlbmQtZW1haWwtc3VtaXQu
Z2FyZ0BsaW5hcm8ub3JnLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0t
a2VybmVsLzIwMjIwOTAzMDkzNDE1LjE1ODUwLTEtbGVjb3B6ZXIuY2hlbkBtZWRpYXRlay5jb20v
Cj4gWzNdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20vMTcyMjEzMDk3Cj4gWzRdIGh0
dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20vMTcyMjEzMTI5Cj4KPiBDaGFuZ2VzIGluIHY4
Ogo+IC0gZHluYW1pY19pcGlfc2V0dXAoKSBhbmQgZHluYW1pY19pcGlfdGVhcmRvd24oKSBubyBs
b25nZXIgdGFrZSBjcHUgcGFyYW0KPiAtIGR5bmFtaWNfaXBpX3NldHVwKCkgYW5kIGR5bmFtaWNf
aXBpX3RlYXJkb3duKCkgbm8gbG9uZ2VyIHRha2UgY3B1IHBhcmFtCj4gLSBBZGQgbG9vbmdhcmNo
IHN1cHBvcnQsIHRvbwo+IC0gUmVtb3ZlZCAiI2lmZGVmIENPTkZJR19TTVAiIHNpbmNlIGFybTY0
IGlzIGFsd2F5cyBTTVAKPiAtICJUYWcgdGhlIGFybTY0IGlkbGUgZnVuY3Rpb25zIGFzIF9fY3B1
aWRsZSIgbmV3IGZvciB2OAo+IC0gIlByb3ZpZGUgYSBzdHViIGtnZGJfbm1pY2FsbGJhY2soKSBp
ZiAhQ09ORklHX0tHREIiIG5ldyBmb3IgdjgKPiAtICJGYWxsYmFjayB0byBhIHJlZ3VsYXIgSVBJ
IGlmIE5NSSBpc24ndCBlbmFibGVkIiBuZXcgZm9yIHY4Cj4KPiBEb3VnbGFzIEFuZGVyc29uICgz
KToKPiAgIGFybTY0OiBpZGxlOiBUYWcgdGhlIGFybTY0IGlkbGUgZnVuY3Rpb25zIGFzIF9fY3B1
aWRsZQo+ICAga2dkYjogUHJvdmlkZSBhIHN0dWIga2dkYl9ubWljYWxsYmFjaygpIGlmICFDT05G
SUdfS0dEQgo+ICAgYXJtNjQ6IGlwaV9ubWk6IEZhbGxiYWNrIHRvIGEgcmVndWxhciBJUEkgaWYg
Tk1JIGlzbid0IGVuYWJsZWQKPgo+IFN1bWl0IEdhcmcgKDcpOgo+ICAgYXJtNjQ6IEFkZCBmcmFt
ZXdvcmsgdG8gdHVybiBJUEkgYXMgTk1JCj4gICBpcnFjaGlwL2dpYy12MzogRW5hYmxlIHN1cHBv
cnQgZm9yIFNHSXMgdG8gYWN0IGFzIE5NSXMKPiAgIGFybTY0OiBzbXA6IEFzc2lnbiBhbmQgc2V0
dXAgYW4gSVBJIGFzIE5NSQo+ICAgbm1pOiBiYWNrdHJhY2U6IEFsbG93IHJ1bnRpbWUgYXJjaCBz
cGVjaWZpYyBvdmVycmlkZQo+ICAgYXJtNjQ6IGlwaV9ubWk6IEFkZCBzdXBwb3J0IGZvciBOTUkg
YmFja3RyYWNlCj4gICBrZ2RiOiBFeHBvc2UgZGVmYXVsdCBDUFVzIHJvdW5kdXAgZmFsbGJhY2sg
bWVjaGFuaXNtCj4gICBhcm02NDoga2dkYjogUm91bmR1cCBjcHVzIHVzaW5nIElQSSBhcyBOTUkK
Pgo+ICBhcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaCAgICAgICB8ICAgMiArLQo+ICBhcmNoL2Fy
bS9rZXJuZWwvc21wLmMgICAgICAgICAgICB8ICAgMyArLQo+ICBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2lycS5oICAgICB8ICAgNCArKwo+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL25taS5oICAg
ICB8ICAxNyArKysrKwo+ICBhcmNoL2FybTY0L2tlcm5lbC9NYWtlZmlsZSAgICAgICB8ICAgMiAr
LQo+ICBhcmNoL2FybTY0L2tlcm5lbC9pZGxlLmMgICAgICAgICB8ICAgNCArLQo+ICBhcmNoL2Fy
bTY0L2tlcm5lbC9pcGlfbm1pLmMgICAgICB8IDEwMyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGFyY2gvYXJtNjQva2VybmVsL2tnZGIuYyAgICAgICAgIHwgIDE4ICsrKysrKwo+
ICBhcmNoL2FybTY0L2tlcm5lbC9zbXAuYyAgICAgICAgICB8ICAgOCArKysKPiAgYXJjaC9sb29u
Z2FyY2gvaW5jbHVkZS9hc20vaXJxLmggfCAgIDIgKy0KPiAgYXJjaC9sb29uZ2FyY2gva2VybmVs
L3Byb2Nlc3MuYyAgfCAgIDMgKy0KPiAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2lycS5oICAgICAg
fCAgIDIgKy0KPiAgYXJjaC9taXBzL2tlcm5lbC9wcm9jZXNzLmMgICAgICAgfCAgIDMgKy0KPiAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25taS5oICAgfCAgIDIgKy0KPiAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9zdGFja3RyYWNlLmMgfCAgIDMgKy0KPiAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9p
cnFfNjQuaCAgfCAgIDIgKy0KPiAgYXJjaC9zcGFyYy9rZXJuZWwvcHJvY2Vzc182NC5jICAgfCAg
IDQgKy0KPiAgYXJjaC94ODYvaW5jbHVkZS9hc20vaXJxLmggICAgICAgfCAgIDIgKy0KPiAgYXJj
aC94ODYva2VybmVsL2FwaWMvaHdfbm1pLmMgICAgfCAgIDMgKy0KPiAgZHJpdmVycy9pcnFjaGlw
L2lycS1naWMtdjMuYyAgICAgfCAgMjkgKysrKysrLS0tCj4gIGluY2x1ZGUvbGludXgva2dkYi5o
ICAgICAgICAgICAgIHwgIDEzICsrKysKPiAgaW5jbHVkZS9saW51eC9ubWkuaCAgICAgICAgICAg
ICAgfCAgMTIgKystLQo+ICBrZXJuZWwvZGVidWcvZGVidWdfY29yZS5jICAgICAgICB8ICAgOCAr
Ky0KPiAgMjMgZmlsZXMgY2hhbmdlZCwgMjE3IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygt
KQoKSXQncyBiZWVuIDMgd2Vla3MgYW5kIEkgaGF2ZW4ndCBoZWFyZCBhIHBlZXAgb24gdGhpcyBz
ZXJpZXMuIFRoYXQKbWVhbnMgbm9ib2R5IGhhcyBhbnkgb2JqZWN0aW9ucyBhbmQgaXQncyBhbGwg
Z29vZCB0byBsYW5kLCByaWdodD8KUmlnaHQ/IDotUAoKU2VyaW91c2x5LCB0aG91Z2gsIEkgcmVh
bGx5IHRoaW5rIHdlIHNob3VsZCBmaWd1cmUgb3V0IGhvdyB0byBnZXQgdGhpcwpsYW5kZWQuIFRo
ZXJlJ3Mgb2J2aW91c2x5IGludGVyZXN0IGZyb20gc2V2ZXJhbCBkaWZmZXJlbnQgcGFydGllcyBh
bmQKSSdtIGNob21waW5nIGF0IHRoZSBiaXQgd2FpdGluZyB0byBzcGluIHRoaXMgc2VyaWVzIGFj
Y29yZGluZyB0byB5b3VyCndpc2hlcy4gSSBhbHNvIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55dGhp
bmcgc3VwZXIgc2NhcnkvdWdseSBoZXJlLiBJTU8KdGhlIGlkZWFsIHNpdHVhdGlvbiBpcyB0aGF0
IGZvbGtzIGFyZSBPSyB3aXRoIHRoZSBpZGVhIHByZXNlbnRlZCBpbgp0aGUgbGFzdCBwYXRjaCBp
biB0aGUgc2VyaWVzICgiYXJtNjQ6IGlwaV9ubWk6IEZhbGxiYWNrIHRvIGEgcmVndWxhcgpJUEkg
aWYgTk1JIGlzbid0IGVuYWJsZWQiKSBhbmQgdGhlbiBJIGNhbiByZS1zcGluIHRoaXMgc2VyaWVz
IHRvIGJlCl9tdWNoXyBzaW1wbGVyLiBUaGF0IGJlaW5nIHNhaWQsIEknbSBhbHNvIE9LIHdpdGgg
ZHJvcHBpbmcgdGhhdCBwYXRjaAphbmQgc3RhcnRpbmcgdGhlIGRpc2N1c3Npb24gZm9yIGhvdyB0
byBsYW5kIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGluCnRoZSBzZXJpZXMuCgpQbGVhc2UgbGV0
IG1lIGtub3chCgotRG91ZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8va2dkYi1idWdyZXBvcnQK
