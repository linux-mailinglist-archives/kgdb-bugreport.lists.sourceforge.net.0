Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BA6FE2B8
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 10 May 2023 18:47:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwmyl-00079M-Hy
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 10 May 2023 16:47:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mark.rutland@arm.com>) id 1pwmyj-00079G-LZ
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/JjhCQnhr0WRZAMN5X6+UYNeef3lmVTEF6A0VRQluE=; b=THvuLHRgfsj0OqDQciO3P71a/F
 rXox2H7T7Yex/arbJ7NjgcSpELSb83dOmshvBr/Cidjf3EcfdcHGEynB9jAzdCte7zG0J5ptJHl/I
 0Ib+NxEmvSHxgwx97ia2+FeW154tsXboBUVw3TNomqjUCPSkJgAfs2gXWt3k8lfktScM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g/JjhCQnhr0WRZAMN5X6+UYNeef3lmVTEF6A0VRQluE=; b=R2mqKQmToSakQuc94yNKf5Ywnj
 3uF9aQNIN0s74eGzULfX56SQe+vQKZWoy0MzS3npsswaqZIXeY4POFoWgFozXfdv6+P6p+3lxyk6E
 /dWwY7TxUnnSaGRrPAWToNtQMC+IHFZWgXijbf5Bm/wEvPa4lBNobAq1ANfLcM+ACWE8=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1pwmyi-0001C6-QM for kgdb-bugreport@lists.sourceforge.net;
 Wed, 10 May 2023 16:47:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98C151063;
 Wed, 10 May 2023 09:31:27 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com
 [10.1.32.173])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 700EB3F67D;
 Wed, 10 May 2023 09:30:35 -0700 (PDT)
Date: Wed, 10 May 2023 17:30:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZFvGqD//pm/lZb+p@FVFF77S0Q05N.cambridge.arm.com>
References: <20230419225604.21204-1-dianders@chromium.org>
 <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Wny=iFQf2GGuC2qP9hy4FHzpiRpV=ZvxEW77DX02XGzQ@mail.gmail.com>
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, May 10, 2023 at 08:28:17AM -0700, Doug Anderson wrote:
    > Hi, Hi Doug, > On Wed, Apr 19, 2023 at 3:57 PM Douglas Anderson <dianders@chromium.org>
    wrote: > > This is an attempt to resurrect Sumit's old patch series [1] that
    > > allowed us to use the arm64 pseudo-NMI to [...] 
 
 Content analysis details:   (-2.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [217.140.110.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pwmyi-0001C6-QM
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 linux-perf-users@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Jason Wessel <jason.wessel@windriver.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMDg6Mjg6MTdBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKCkhpIERvdWcsCgo+IE9uIFdlZCwgQXByIDE5LCAyMDIzIGF0IDM6NTfigK9Q
TSBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gVGhp
cyBpcyBhbiBhdHRlbXB0IHRvIHJlc3VycmVjdCBTdW1pdCdzIG9sZCBwYXRjaCBzZXJpZXMgWzFd
IHRoYXQKPiA+IGFsbG93ZWQgdXMgdG8gdXNlIHRoZSBhcm02NCBwc2V1ZG8tTk1JIHRvIGdldCBi
YWNrdHJhY2VzIG9mIENQVXMgYW5kCj4gPiBhbHNvIHRvIHJvdW5kIHVwIENQVXMgaW4ga2RiL2tn
ZGIuIFRoZSBsYXN0IHBvc3QgZnJvbSBTdW1pdCB0aGF0IEkKPiA+IGNvdWxkIGZpbmQgd2FzIHY3
LCBzbyBJIGNhbGxlZCB0aGlzIHNlcmllcyB2OC4gSSBoYXZlbid0IGNvcGllZCBhbGwgb2YKPiA+
IGhpcyBvbGQgY2hhbmdlbG9uZ3MgaGVyZSwgYnV0IHlvdSBjYW4gZmluZCB0aGVtIGZyb20gdGhl
IGxpbmsuCj4gPgo+ID4gU2luY2UgdjcsIEkgaGF2ZToKPiA+ICogQWRkcmVzc2VkIHRoZSBzbWFs
bCBhbW91bnQgb2YgZmVlZGJhY2sgdGhhdCB3YXMgdGhlcmUgZm9yIHY3Lgo+ID4gKiBSZWJhc2Vk
Lgo+ID4gKiBBZGRlZCBhIG5ldyBwYXRjaCB0aGF0IHByZXZlbnRzIHVzIGZyb20gc3BhbW1pbmcg
dGhlIGxvZ3Mgd2l0aCBpZGxlCj4gPiAgIHRhc2tzLgo+ID4gKiBBZGRlZCBhbiBleHRyYSBwYXRj
aCB0byBncmFjZWZ1bGx5IGZhbGwgYmFjayB0byByZWd1bGFyIElQSXMgaWYKPiA+ICAgcHNldWRv
LU5NSXMgYXJlbid0IHRoZXJlLgo+ID4KPiA+IFNpbmNlIHRoZXJlIGFwcGVhciB0byBiZSBhIGZl
dyBkaWZmZXJlbnQgcGF0Y2hlcyBzZXJpZXMgcmVsYXRlZCB0bwo+ID4gYmVpbmcgYWJsZSB0byB1
c2UgTk1JcyB0byBnZXQgc3RhY2sgdHJhY2VzIG9mIGNyYXNoZWQgc3lzdGVtcywgbGV0IG1lCj4g
PiB0cnkgdG8gb3JnYW5pemUgdGhlbSB0byB0aGUgYmVzdCBvZiBteSB1bmRlcnN0YW5kaW5nOgo+
ID4KPiA+IGEpIFRoaXMgc2VyaWVzLiBPbiBpdHMgb3duLCBhKSB3aWxsIChhbW9uZyBvdGhlciB0
aGluZ3MpIGVuYWJsZSBzdGFjawo+ID4gICAgdHJhY2VzIG9mIGFsbCBydW5uaW5nIHByb2Nlc3Nl
cyB3aXRoIHRoZSBzb2Z0IGxvY2t1cCBkZXRlY3RvciBpZgo+ID4gICAgeW91J3ZlIGVuYWJsZWQg
dGhlIHN5c2N0bCAia2VybmVsLnNvZnRsb2NrdXBfYWxsX2NwdV9iYWNrdHJhY2UiLiBPbgo+ID4g
ICAgaXRzIG93biwgYSkgZG9lc24ndCBnaXZlIGEgaGFyZCBsb2NrdXAgZGV0ZWN0b3IuCj4gPgo+
ID4gYikgQSBkaWZmZXJlbnQgcmVjZW50bHktcG9zdGVkIHNlcmllcyBbMl0gdGhhdCBhZGRzIGEg
aGFyZCBsb2NrdXAKPiA+ICAgIGRldGVjdG9yIGJhc2VkIG9uIHBlcmYuIE9uIGl0cyBvd24sIGIp
IGdpdmVzIGEgc3RhY2sgY3Jhd2wgb2YgdGhlCj4gPiAgICBsb2NrZWQgdXAgQ1BVIGJ1dCBubyBz
dGFjayBjcmF3bHMgb2Ygb3RoZXIgQ1BVcyAoZXZlbiBpZiB0aGV5J3JlCj4gPiAgICBsb2NrZWQg
dG9vKS4gVG9nZXRoZXIgd2l0aCBhKSArIGIpIHdlIGdldCBldmVyeXRoaW5nIChmdWxsIGxvY2t1
cAo+ID4gICAgZGV0ZWN0LCBmdWxsIGFiaWxpdHkgdG8gZ2V0IHN0YWNrIGNyYXdscykuCj4gPgo+
ID4gYykgVGhlIG9sZCBBbmRyb2lkICJidWRkeSIgaGFyZCBsb2NrdXAgZGV0ZWN0b3IgWzNdIHRo
YXQgSSdtCj4gPiAgICBjb25zaWRlcmluZyB0cnlpbmcgdG8gdXBzdHJlYW0uIElmIGIpIGxhbmRz
IHRoZW4gSSBiZWxpZXZlIGMpIHdvdWxkCj4gPiAgICBiZSByZWR1bmRhbnQgKGF0IGxlYXN0IGZv
ciBhcm02NCkuIGMpIG9uIGl0cyBvd24gaXMgcmVhbGx5IG9ubHkKPiA+ICAgIHVzZWZ1bCBvbiBh
cm02NCBmb3IgcGxhdGZvcm1zIHRoYXQgY2FuIHByaW50IENQVV9EQkdQQ1NSIHNvbWVob3cKPiA+
ICAgIChzZWUgWzRdKS4gYSkgKyBjKSBpcyByb3VnaGx5IGFzIGdvb2QgYXMgYSkgKyBiKS4KCj4g
SXQncyBiZWVuIDMgd2Vla3MgYW5kIEkgaGF2ZW4ndCBoZWFyZCBhIHBlZXAgb24gdGhpcyBzZXJp
ZXMuIFRoYXQKPiBtZWFucyBub2JvZHkgaGFzIGFueSBvYmplY3Rpb25zIGFuZCBpdCdzIGFsbCBn
b29kIHRvIGxhbmQsIHJpZ2h0Pwo+IFJpZ2h0PyA6LVAKCkZXSVcsIHRoZXJlIGFyZSBzdGlsbCBs
b25nc3RhbmRpbmcgc291bmRuZXNzIGlzc3VlcyBpbiB0aGUgYXJtNjQgcHNldWRvLU5NSQpzdXBw
b3J0IChhbmQgZml4aW5nIHRoYXQgcmVxdWlyZXMgYW4gb3ZlcmhhdWwgb2Ygb3VyIERBSUYgLyBJ
UlEgZmxhZwptYW5hZ2VtZW50LCB3aGljaCBJJ3ZlIGJlZW4gY2hpcHBpbmcgYXdheSBhdCBmb3Ig
YSBudW1iZXIgb2YgcmVsZWFzZXMpLCBzbyBJCmhhZG4ndCBsb29rZWQgYXQgdGhpcyBpbiBkZXRh
aWwgeWV0IGJlY2F1c2UgdGhlIGZvdW5kYXRpb25zIGFyZSBzdGlsbCBzb21ld2hhdApkb2RneS4K
CkkgYXBwcmVjaWF0ZSB0aGF0IHRoaXMgaGFzIGJlZW4gYXJvdW5kIGZvciBhIHdoaWxlLCBhbmQg
aXQncyBvbiBteSBxdWV1ZSB0bwpsb29rIGF0LgoKVGhhbmtzLApNYXJrLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxp
bmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
