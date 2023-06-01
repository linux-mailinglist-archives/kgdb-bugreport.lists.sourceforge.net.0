Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE30071F4FC
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:46:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4q8G-0004sN-VD
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:46:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4q8F-0004sH-M0
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=; b=Cjopfpbi7PstJRlwWVYpE7JUdE
 nKI8gMuaEW2K+dUviPmSWf5TZVa8kOmBSIWBRABYPK9pA4/rWlx1uWiK0GOpESCxDZk3eXS81e4rc
 apYU1cdkORWswbDyvHCb8jv1Z1aVFFZOwUia8loXZU7aIxpdVP/v/xyxNM4BxOTgRP84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=; b=lKmHX0gZiFAM6aVAseNR1FRILE
 USh/yw9H/1mCUb50h409Znt100zOtfHaEBcbWgJa7rx3yNWLKRHtVGrLGMrCnaXeIb5pFQjQKVRs8
 jFf5c82oqz25sKcgYEaRlnmvF/1vWG+NGLaqqBo3bzPLcFq9HTB9R9OgZV3JYLdBGdX8=;
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4q8C-0005aD-1n for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:46:56 +0000
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7770b7c2fa5so15999539f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685656005; x=1688248005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=;
 b=Ee/aWVkP6dLFii/0ABOq4+Zm2PkiqwErhzLGUfM8GcNcdK0qdb+e2YJi3vTOAIk4Vy
 rYYAe+DxD/ceEvZobxwjuF6+zW/xcaAFyYlYsYUt41lklmZmNPRYQpIzAfJ4y0thvyIt
 GyusawNT3QlfrR0pDYOCwwEXPAFz9qsnZ7uyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685656005; x=1688248005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLtvBlY/v8HYwh0Fbm6omkkXXBfFwuezcGJpiAwvtOM=;
 b=derKIx7CLdd8+9aSocb+be+MyYiW5s+gD3yaxJZ2uH/KoxgcCyjGmnO1sdw+nicLF1
 wH77rmXjCZw4gmU+274XsPqk9po1LXAJ27LS5iry+pzWpAAqtgY/2a/NiaKkdw02vI7Q
 6oNw4JIlSxv3jAV2s9OEcM67akG9yMWHisRpMxqrt5nM9jXdhySUZs558g4oj7bi+vTs
 gRhXN6Kj3gy7kAQ4NK5dbJdpWGBPYoU4qgXSn60blKysZBiLdJhj+loJEHVARDjvewIg
 Zx76Zi21VTTHJex+6mcaqvshaGicwSNeZGC+yzOnPnqnF9gKjk6EYvCXP9lKMOWfl87n
 wo+Q==
X-Gm-Message-State: AC+VfDxlhac7sT3uUoaSMrDo99TNbajrZbq4ZjlnVxnuHzInI1yGAvPB
 o82Zcek7h6Z/Hd4vMlLdPxxDOdU1yNcTOfwt/Ek=
X-Google-Smtp-Source: ACHHUZ4w/LQ8fw3GlZlC//W2zIzVTnu/cmZBOVQZQUrNMBmKhgZiPU8QhQqAuzRLXVV8jb5iXwe9qQ==
X-Received: by 2002:a5d:8b8e:0:b0:76c:4e1f:df9b with SMTP id
 p14-20020a5d8b8e000000b0076c4e1fdf9bmr534477iol.15.1685656004919; 
 Thu, 01 Jun 2023 14:46:44 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b00411baa5ec5asm2438617jai.154.2023.06.01.14.46.43
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 14:46:44 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-33b398f2ab8so43475ab.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:46:43 -0700 (PDT)
X-Received: by 2002:a05:6e02:17c7:b0:33b:7a45:a950 with SMTP id
 z7-20020a056e0217c700b0033b7a45a950mr70308ilu.18.1685656003076; Thu, 01 Jun
 2023 14:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230419225604.21204-1-dianders@chromium.org>
 <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
 <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
 <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
In-Reply-To: <CAD=FV=WjX-XD6tX3hZq0GOh9e+Pc1jMMYP8DCc=u1YWQ2E5hYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Jun 2023 14:46:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx=64ZYqNvOBRHu-+yFWtxkzCyjAxZED2xEFqoMKvAqQ@mail.gmail.com>
Message-ID: <CAD=FV=Vx=64ZYqNvOBRHu-+yFWtxkzCyjAxZED2xEFqoMKvAqQ@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, May 10, 2023 at 9:42 AM Doug Anderson <dianders@chromium.org>
    wrote: > > Hi, > > On Wed, May 10, 2023 at 9:30 AM Mark Rutland <mark.rutland@arm.com>
    wrote: > > > > On Wed, May 10, 2023 at [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.42 listed in wl.mailspike.net]
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
X-Headers-End: 1q4q8C-0005aD-1n
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, Ulf Hansson <ulf.hansson@linaro.org>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Pierre Gondois <Pierre.Gondois@arm.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, loongarch@lists.linux.dev,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>,
 Joey Gouly <joey.gouly@arm.com>, Ben Dooks <ben-linux@fluff.org>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ito-yuichi@fujitsu.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIE1heSAxMCwgMjAyMyBhdCA5OjQy4oCvQU0gRG91ZyBBbmRlcnNvbiA8ZGlh
bmRlcnNAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gV2VkLCBNYXkgMTAsIDIw
MjMgYXQgOTozMOKAr0FNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDA4OjI4OjE3QU0gLTA3MDAsIERvdWcg
QW5kZXJzb24gd3JvdGU6Cj4gPiA+IEhpLAo+ID4KPiA+IEhpIERvdWcsCj4gPgo+ID4gPiBPbiBX
ZWQsIEFwciAxOSwgMjAyMyBhdCAzOjU34oCvUE0gRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNA
Y2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4gPiBUaGlzIGlzIGFuIGF0dGVtcHQgdG8gcmVzdXJy
ZWN0IFN1bWl0J3Mgb2xkIHBhdGNoIHNlcmllcyBbMV0gdGhhdAo+ID4gPiA+IGFsbG93ZWQgdXMg
dG8gdXNlIHRoZSBhcm02NCBwc2V1ZG8tTk1JIHRvIGdldCBiYWNrdHJhY2VzIG9mIENQVXMgYW5k
Cj4gPiA+ID4gYWxzbyB0byByb3VuZCB1cCBDUFVzIGluIGtkYi9rZ2RiLiBUaGUgbGFzdCBwb3N0
IGZyb20gU3VtaXQgdGhhdCBJCj4gPiA+ID4gY291bGQgZmluZCB3YXMgdjcsIHNvIEkgY2FsbGVk
IHRoaXMgc2VyaWVzIHY4LiBJIGhhdmVuJ3QgY29waWVkIGFsbCBvZgo+ID4gPiA+IGhpcyBvbGQg
Y2hhbmdlbG9uZ3MgaGVyZSwgYnV0IHlvdSBjYW4gZmluZCB0aGVtIGZyb20gdGhlIGxpbmsuCj4g
PiA+ID4KPiA+ID4gPiBTaW5jZSB2NywgSSBoYXZlOgo+ID4gPiA+ICogQWRkcmVzc2VkIHRoZSBz
bWFsbCBhbW91bnQgb2YgZmVlZGJhY2sgdGhhdCB3YXMgdGhlcmUgZm9yIHY3Lgo+ID4gPiA+ICog
UmViYXNlZC4KPiA+ID4gPiAqIEFkZGVkIGEgbmV3IHBhdGNoIHRoYXQgcHJldmVudHMgdXMgZnJv
bSBzcGFtbWluZyB0aGUgbG9ncyB3aXRoIGlkbGUKPiA+ID4gPiAgIHRhc2tzLgo+ID4gPiA+ICog
QWRkZWQgYW4gZXh0cmEgcGF0Y2ggdG8gZ3JhY2VmdWxseSBmYWxsIGJhY2sgdG8gcmVndWxhciBJ
UElzIGlmCj4gPiA+ID4gICBwc2V1ZG8tTk1JcyBhcmVuJ3QgdGhlcmUuCj4gPiA+ID4KPiA+ID4g
PiBTaW5jZSB0aGVyZSBhcHBlYXIgdG8gYmUgYSBmZXcgZGlmZmVyZW50IHBhdGNoZXMgc2VyaWVz
IHJlbGF0ZWQgdG8KPiA+ID4gPiBiZWluZyBhYmxlIHRvIHVzZSBOTUlzIHRvIGdldCBzdGFjayB0
cmFjZXMgb2YgY3Jhc2hlZCBzeXN0ZW1zLCBsZXQgbWUKPiA+ID4gPiB0cnkgdG8gb3JnYW5pemUg
dGhlbSB0byB0aGUgYmVzdCBvZiBteSB1bmRlcnN0YW5kaW5nOgo+ID4gPiA+Cj4gPiA+ID4gYSkg
VGhpcyBzZXJpZXMuIE9uIGl0cyBvd24sIGEpIHdpbGwgKGFtb25nIG90aGVyIHRoaW5ncykgZW5h
YmxlIHN0YWNrCj4gPiA+ID4gICAgdHJhY2VzIG9mIGFsbCBydW5uaW5nIHByb2Nlc3NlcyB3aXRo
IHRoZSBzb2Z0IGxvY2t1cCBkZXRlY3RvciBpZgo+ID4gPiA+ICAgIHlvdSd2ZSBlbmFibGVkIHRo
ZSBzeXNjdGwgImtlcm5lbC5zb2Z0bG9ja3VwX2FsbF9jcHVfYmFja3RyYWNlIi4gT24KPiA+ID4g
PiAgICBpdHMgb3duLCBhKSBkb2Vzbid0IGdpdmUgYSBoYXJkIGxvY2t1cCBkZXRlY3Rvci4KPiA+
ID4gPgo+ID4gPiA+IGIpIEEgZGlmZmVyZW50IHJlY2VudGx5LXBvc3RlZCBzZXJpZXMgWzJdIHRo
YXQgYWRkcyBhIGhhcmQgbG9ja3VwCj4gPiA+ID4gICAgZGV0ZWN0b3IgYmFzZWQgb24gcGVyZi4g
T24gaXRzIG93biwgYikgZ2l2ZXMgYSBzdGFjayBjcmF3bCBvZiB0aGUKPiA+ID4gPiAgICBsb2Nr
ZWQgdXAgQ1BVIGJ1dCBubyBzdGFjayBjcmF3bHMgb2Ygb3RoZXIgQ1BVcyAoZXZlbiBpZiB0aGV5
J3JlCj4gPiA+ID4gICAgbG9ja2VkIHRvbykuIFRvZ2V0aGVyIHdpdGggYSkgKyBiKSB3ZSBnZXQg
ZXZlcnl0aGluZyAoZnVsbCBsb2NrdXAKPiA+ID4gPiAgICBkZXRlY3QsIGZ1bGwgYWJpbGl0eSB0
byBnZXQgc3RhY2sgY3Jhd2xzKS4KPiA+ID4gPgo+ID4gPiA+IGMpIFRoZSBvbGQgQW5kcm9pZCAi
YnVkZHkiIGhhcmQgbG9ja3VwIGRldGVjdG9yIFszXSB0aGF0IEknbQo+ID4gPiA+ICAgIGNvbnNp
ZGVyaW5nIHRyeWluZyB0byB1cHN0cmVhbS4gSWYgYikgbGFuZHMgdGhlbiBJIGJlbGlldmUgYykg
d291bGQKPiA+ID4gPiAgICBiZSByZWR1bmRhbnQgKGF0IGxlYXN0IGZvciBhcm02NCkuIGMpIG9u
IGl0cyBvd24gaXMgcmVhbGx5IG9ubHkKPiA+ID4gPiAgICB1c2VmdWwgb24gYXJtNjQgZm9yIHBs
YXRmb3JtcyB0aGF0IGNhbiBwcmludCBDUFVfREJHUENTUiBzb21laG93Cj4gPiA+ID4gICAgKHNl
ZSBbNF0pLiBhKSArIGMpIGlzIHJvdWdobHkgYXMgZ29vZCBhcyBhKSArIGIpLgo+ID4KPiA+ID4g
SXQncyBiZWVuIDMgd2Vla3MgYW5kIEkgaGF2ZW4ndCBoZWFyZCBhIHBlZXAgb24gdGhpcyBzZXJp
ZXMuIFRoYXQKPiA+ID4gbWVhbnMgbm9ib2R5IGhhcyBhbnkgb2JqZWN0aW9ucyBhbmQgaXQncyBh
bGwgZ29vZCB0byBsYW5kLCByaWdodD8KPiA+ID4gUmlnaHQ/IDotUAo+ID4KPiA+IEZXSVcsIHRo
ZXJlIGFyZSBzdGlsbCBsb25nc3RhbmRpbmcgc291bmRuZXNzIGlzc3VlcyBpbiB0aGUgYXJtNjQg
cHNldWRvLU5NSQo+ID4gc3VwcG9ydCAoYW5kIGZpeGluZyB0aGF0IHJlcXVpcmVzIGFuIG92ZXJo
YXVsIG9mIG91ciBEQUlGIC8gSVJRIGZsYWcKPiA+IG1hbmFnZW1lbnQsIHdoaWNoIEkndmUgYmVl
biBjaGlwcGluZyBhd2F5IGF0IGZvciBhIG51bWJlciBvZiByZWxlYXNlcyksIHNvIEkKPiA+IGhh
ZG4ndCBsb29rZWQgYXQgdGhpcyBpbiBkZXRhaWwgeWV0IGJlY2F1c2UgdGhlIGZvdW5kYXRpb25z
IGFyZSBzdGlsbCBzb21ld2hhdAo+ID4gZG9kZ3kuCj4gPgo+ID4gSSBhcHByZWNpYXRlIHRoYXQg
dGhpcyBoYXMgYmVlbiBhcm91bmQgZm9yIGEgd2hpbGUsIGFuZCBpdCdzIG9uIG15IHF1ZXVlIHRv
Cj4gPiBsb29rIGF0Lgo+Cj4gQWgsIHRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwISBXZSd2ZSBiZWVu
IHRoaW5raW5nIGFib3V0IHR1cm5pbmcgdGhpcyBvbgo+IGluIHByb2R1Y3Rpb24gaW4gQ2hyb21l
T1MgYmVjYXVzZSBpdCB3aWxsIGhlbHAgdXMgdHJhY2sgZG93biBhIHdob2xlCj4gY2xhc3Mgb2Yg
ZmllbGQtZ2VuZXJhdGVkIGNyYXNoIHJlcG9ydHMgdGhhdCBhcmUgb3RoZXJ3aXNlIG9wYXF1ZSB0
bwo+IHVzLiBJdCBzb3VuZHMgYXMgaWYgbWF5YmUgdGhhdCdzIG5vdCBhIGdvb2QgaWRlYSBxdWl0
ZSB5ZXQ/IERvIHlvdQo+IGhhdmUgYW55IGlkZWEgb2YgaG93IG11Y2ggZmFydGhlciBhbG9uZyB0
aGlzIG5lZWRzIHRvIGdvPwoKSSdtIHN0aWxsIHZlcnkgaW50ZXJlc3RlZCBpbiB0aGlzIHRvcGlj
LiBEbyB5b3UgaGF2ZSBhbnl0aGluZyBjb25jcmV0ZQp0aGF0IGlzIGJyb2tlbj8gWW91ciByZXBs
eSBnaXZlcyBtZSB0aGUgdmliZSB0aGF0IHRoZXJlIGhhdmUgYmVlbiBhCmJ1bmNoIG9mIGJ1Z3Mg
Zm91bmQgcmVjZW50bHkgYW5kLCB3aGlsZSB0aGVyZSBhcmUgbm8ga25vd24gaXNzdWVzLAp5b3Un
cmUgd29ycmllZCB0aGF0IHRoZXJlIG1pZ2h0IGJlIHNvbWV0aGluZyBsaW5nZXJpbmcgc3RpbGwu
IElzIHRoYXQKY29ycmVjdCwgb3IgZG8geW91IGhhdmUgc29tZXRoaW5nIGNvbmNyZXRlIHRoYXQn
cyBicm9rZW4/IElzIHRoaXMKYW55dGhpbmcgb3RoZXJzIGNvdWxkIGhlbHAgd2l0aD8gSSBjb3Vs
ZCBtYWtlIGFuIGF0dGVtcHQsIG9yIHdlIG1pZ2h0CmJlIGFibGUgdG8gcm9wZSBzb21lIG9mIHRo
ZSBvdGhlcnMgaW50ZXJlc3RlZCBpbiB0aGlzIHRvcGljIGFuZCBtb3JlCkdJQy1rbm93bGVkZ2Vh
YmxlIHRvIGhlbHA/CgpJIHN0aWxsIGhhdmUgYSBnb2FsIGZvciB0dXJuaW5nIHRoaXMgb24gZm9y
IHByb2R1Y3Rpb24gYnV0IG9idmlvdXNseQpkb24ndCB3YW50IHRvIG1ha2UgdGhlIGRldmljZSBj
cmFzaGllciBiZWNhdXNlIG9mIGl0LgoKQWxzbzogaWYgdGhpcyByZWFsbHkgaGFzIGtub3duIGJ1
Z3MsIHNob3VsZCB3ZSBwdXQgYSBiaWcgV0FSTl9PTiBzcGxhdAppZiBhbnlvbmUgdHJpZXMgdG8g
dHVybiBvbiBwc2V1ZG8gTk1Jcz8gV2l0aG91dCB0aGF0LCBpdCBmZWVscyBsaWtlCml0J3MgYSBi
aXQgb2YgYSBmb290Z3VuLgoKCj4gLi4ub2YKPiBjb3Vyc2UsIHdlJ3ZlIGFsc28gcnVuIGludG8g
aXNzdWVzIHdpdGggTWVkaWF0ZWsgZGV2aWNlcyBiZWNhdXNlIHRoZXkKPiBkb24ndCBzYXZlL3Jl
c3RvcmUgR0lDUiByZWdpc3RlcnMgcHJvcGVybHkgWzFdLiBJbiB0aGVvcnksIHdlIG1pZ2h0IGJl
Cj4gYWJsZSB0byB3b3JrIGFyb3VuZCB0aGF0IGluIHRoZSBrZXJuZWwuCgpUbyBmb2xsb3d1cCB3
aXRoIHRoaXMsIHdlJ3ZlIGZvcm11bGF0ZWQgYSBwbGFuIGZvciBkZWFsaW5nIHdpdGgKTWVkaWF0
ZWsgQ2hyb21lYm9va3MuIEkgZG91YnQgYW55b25lIGlzIHRydWx5IGludGVyZXN0ZWQsIGJ1dCBp
ZgphbnlvbmUgaXMgdGhlIGRldGFpbHMgYXJlIGluIHRoZSBwdWJsaWMgR29vZ2xlIGJ1ZyB0cmFj
a2VyIFsxXS4gTm9uZQpvZiB0aGF0IHNob3VsZCBibG9jayBsYWRpbmcgdGhlIE5NSSBiYWNrdHJh
Y2Ugc2VyaWVzLgoKCj4gSW4gYW55IGNhc2UsIGV2ZW4gaWYgdGhlcmUgYXJlIGJ1Z3MgdGhhdCB3
b3VsZCBwcmV2ZW50IHR1cm5pbmcgdGhpcyBvbgo+IGZvciBwcm9kdWN0aW9uLCBpdCBzdGlsbCBz
ZWVtcyBsaWtlIHdlIGNvdWxkIHN0aWxsIGxhbmQgdGhpcyBzZXJpZXMuCj4gSXQgc2ltcGx5IHdv
dWxkbid0IGRvIGFueXRoaW5nIHVudGlsIHNvbWVvbmUgdHVybmVkIG9uIHBzZXVkbyBOTUlzLAo+
IHdoaWNoIHdvdWxkbid0IGhhcHBlbiB0aWxsIHRoZSBraW5rcyBhcmUgd29ya2VkIG91dC4KPgo+
IC4uLmFjdHVhbGx5LCBJIGd1ZXNzIEkgc2hvdWxkIHNheSB0aGF0IGlmIGFsbCB0aGUgcGF0Y2hl
cyBvZiB0aGUKPiBjdXJyZW50IHNlcmllcyBkbyBsYW5kIHRoZW4gaXQgYWN0dWFsbHkgX3dvdWxk
XyBzdGlsbCBkbyBzb21ldGhpbmcsCj4gZXZlbiB3aXRob3V0IHBzZXVkby1OTUkuIEFzc3VtaW5n
IHRoZSBsYXN0IHBhdGNoIGxvb2tzIE9LLCBpdCB3b3VsZCBhdAo+IGxlYXN0IHN0YXJ0IGZhbGxp
bmcgYmFjayB0byB1c2luZyByZWd1bGFyIElQSXMgdG8gZG8gYmFja3RyYWNlcy4gVGhhdAo+IHdv
dWxkbid0IGdldCBiYWNrdHJhY2VzIG9uIGhhcmQgbG9ja2VkIHVwIENQVXMgYnV0IGl0IHdvdWxk
IGJlIGJldHRlcgo+IHRoYW4gd2hhdCB3ZSBoYXZlIHRvZGF5IHdoZXJlIHdlIGRvbid0IGdldCBh
bnkgYmFja3RyYWNlcy4gVGhpcyB3b3VsZAo+IGdldCBhcm02NCBvbiBwYXIgd2l0aCBhcm0zMi4u
LgoKVGhlIG1vcmUgSSB0aG91Z2h0IGFib3V0IGl0LCB0aGUgbW9yZSBJIGxpa2VkIHRoZSBpZGVh
IG9mIGdvaW5nIGZ1bGwKaG9nIG9uIHRoZSBpZGVhIGluIHBhdGNoICMxMC4gSSd2ZSBwb3N0ZWQg
djkgWzJdIHdoZXJlIEkndmUgcmVhbGx5CmVtYnJhY2VkIHRoZSBpZGVhIG9mIGZhbGxpbmcgYmFj
ayB0byBhIHJlZ3VsYXIgSVBJIGlmIE5NSSBpc24ndAphdmFpbGFibGUuIEhvcGVmdWxseSBpdCBs
b29rcyBrZWVuLgoKWzFdIGh0dHBzOi8vaXNzdWV0cmFja2VyLmdvb2dsZS5jb20vMjgxODMxMjg4
ClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNjAxMjEzNDQwLjI0ODg2NjctMS1k
aWFuZGVyc0BjaHJvbWl1bS5vcmcKCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVn
cmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
