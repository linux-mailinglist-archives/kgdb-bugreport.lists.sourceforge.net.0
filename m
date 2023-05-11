Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D16FF103
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 14:03:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px518-0001xU-Rf
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 12:03:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px517-0001xO-3A
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 12:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YGmP0u0OFjbVyESVuzglMRxquKrNFdNgsdI3jgZKbt0=; b=FMl747jbAzYnkazJUbI+/YgwU4
 pbbDuA+/QyLo3RRv88hFMSGDRRkY60aotZjkICoE/r8hFsNDykBo7i2w4345/qGOPmj9R5oriIPzg
 3wqkn9/taWaZj+yknibXVb+saRH7CtsbJmeJjUHNmc855aa2zqaNNWBiXAld+AvISces=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YGmP0u0OFjbVyESVuzglMRxquKrNFdNgsdI3jgZKbt0=; b=bREtY3PCYokl1qXUfRiEpK6/Wd
 T0VL5G7bqykTaqw5hS1v+rw4vgKyT/GBpyWLcgr7v86+62dc6l1QQxYYOQhMhJmYWqP5OUXHqHSAm
 S26pKgxifPO9F1Osy+vTAXp/B0NAVOhcQfaHxBDsPWmuoyYsNopgk4F0yHI5xnM8IMo8=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px514-0008Fk-2L for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 12:03:29 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D62961FE4F;
 Thu, 11 May 2023 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683806598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YGmP0u0OFjbVyESVuzglMRxquKrNFdNgsdI3jgZKbt0=;
 b=g9sUnPfOIY8lwxWdiiWc/xnL7HCVL9aggbspPeONqRftNaW6qY3P89Jgww7yxDbnrlvevV
 Uo0u1si4QYQaBK2mS23fDev9ZvfnecluMX3ytVJmRVyfXpbcJwaaJ0t1xCWpu1iCrGJW8X
 t5wOiT1q7D9yde/8RgZQtfeGxu5jj3k=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4C8CA2C141;
 Thu, 11 May 2023 12:03:15 +0000 (UTC)
Date: Thu, 11 May 2023 14:03:12 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZFzZgPBkhJokN1QJ@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.7.Id4133d3183e798122dc3b6205e7852601f289071@changeid>
 <CSE09YL4X0XY.1GAQWAFOOEK42@wheely>
 <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vom15dOxnp=x5RFsk7ZCXGVwUjjrA4z1js-cCB=PDLFg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 2023-05-05 09:37:50, Doug Anderson wrote: > Hi, > >
    On Thu, May 4, 2023 at 7:58 PM Nicholas Piggin <npiggin@gmail.com> wrote:
    > > > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrot [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1px514-0008Fk-2L
Subject: Re: [Kgdb-bugreport] [PATCH v4 07/17] watchdog/hardlockup: Move
 perf hardlockup checking/panic to common watchdog.c
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, ito-yuichi@fujitsu.com,
 linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gRnJpIDIwMjMtMDUtMDUgMDk6Mzc6NTAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBNYXkgNCwgMjAyMyBhdCA3OjU44oCvUE0gTmljaG9sYXMgUGlnZ2luIDxucGln
Z2luQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpIE1heSA1LCAyMDIzIGF0IDg6MTMg
QU0gQUVTVCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gVGhlIHBlcmYgaGFyZGxvY2t1
cCBkZXRlY3RvciB3b3JrcyBieSBsb29raW5nIGF0IGludGVycnVwdCBjb3VudHMgYW5kCj4gPiA+
IHNlZWluZyBpZiB0aGV5IGNoYW5nZSBmcm9tIHJ1biB0byBydW4uIFRoZSBpbnRlcnJ1cHQgY291
bnRzIGFyZQo+ID4gPiBtYW5hZ2VkIGJ5IHRoZSBjb21tb24gd2F0Y2hkb2cgY29kZSB2aWEgaXRz
IHdhdGNoZG9nX3RpbWVyX2ZuKCkuCj4gPiA+Cj4gPiA+IEN1cnJlbnRseSB0aGUgQVBJIGJldHdl
ZW4gdGhlIHBlcmYgZGV0ZWN0b3IgYW5kIHRoZSBjb21tb24gY29kZSBpcyBhCj4gPiA+IGZ1bmN0
aW9uOiBpc19oYXJkbG9ja3VwKCkuIFdoZW4gdGhlIGhhcmQgbG9ja3VwIGRldGVjdG9yIHNlZXMg
dGhhdAo+ID4gPiBmdW5jdGlvbiByZXR1cm4gdHJ1ZSB0aGVuIGl0IGhhbmRsZXMgcHJpbnRpbmcg
b3V0IGRlYnVnIGluZm8gYW5kCj4gPiA+IGluZHVjaW5nIGEgcGFuaWMgaWYgbmVjZXNzYXJ5Lgo+
ID4gPgo+ID4gPiBMZXQncyBjaGFuZ2UgdGhlIEFQSSBhIGxpdHRsZSBiaXQgaW4gcHJlcGFyYXRp
b24gZm9yIHRoZSBidWRkeQo+ID4gPiBoYXJkbG9ja3VwIGRldGVjdG9yLiBUaGUgYnVkZHkgaGFy
ZGxvY2t1cCBkZXRlY3RvciB3YW50cyB0byBwcmludAo+ID4KPiA+IEkgdGhpbmsgdGhlIG5hbWUg
Y2hhbmdlIGlzIGEgZ3JhdHVpdG91cy4gRXNwZWNpYWxseSBzaW5jZSBpdCdzIG5vdwo+ID4gc3Rh
dGljLgo+ID4KPiA+IHdhdGNoZG9nX2hhcmRsb2NrdXBfIGlzIGEgcHJldHR5IGxvbmcgcHJlZml4
IHRvbywgaGFyZGxvY2t1cF8KPiA+IHNob3VsZCBiZSBlbm91Z2g/Cj4gPgo+ID4gU2VlbXMgb2th
eSBvdGhlcndpc2UgdGhvdWdoLgo+IAo+IEkgd2VudCBiYWNrIGFuZCBmb3J0aCBvbiBuYW1lcyBm
YXIgdG9vIG11Y2ggd2hlbiBjb25zdHJ1Y3RpbmcgdGhpcwo+IHBhdGNoIHNlcmllcy4gTW9zdGx5
IEkgd2FzIHRyeWluZyB0byBiYWxhbmNlIHdoYXQgbG9va2VkIGdvb2QgdG8gbWUKPiBhbmQgd2hh
dCBQZXRyIHN1Z2dlc3RlZCBbMV0uIEknbSBub3Qgc3VwZXIgcGlja3kgYWJvdXQgdGhlIG5hbWVz
IGFuZAo+IEknbSBoYXBweSB0byBjaGFuZ2UgdGhlbSBhbGwgdG8gYSAiaGFyZGxvY2t1cF8iIHBy
ZWZpeC4gSSdkIGxvdmUgdG8KPiBoZWFyIFBldHIncyBvcGluaW9uLgoKU2lnaCwgdGhlIG9yaWdp
bmFsIGNvZGUgd2FzIGEgcmVhbCBtZXNzIG9mIG5hbWluZyBzY2hlbWVzLiBJdCBpcyBoYXJkCnRv
IHNheSBob3cgdG8gbW92ZSBmb3J3YXJkLgoKTXkgb3BpbmlvbjoKCiAgKyB3YXRjaGRvZ19oYXJk
bG9ja3VwX2NoZWNrKCk6IGxvb2tzIGZpbmUuIEl0IGlzIGNvbnNpc3RlbnQgd2l0aAoJd2F0Y2hk
b2dfaGFyZGxvY2t1cF9lbmFibGUoKS9kaXNhYmxlKCkuCgogICsgd2F0Y2hkb2dfaGFyZGxvY2t1
cF9pc19sb2NrZWR1cCgpIGlzIHJlYWxseSBvdmVybHkgY29tcGxpY2F0ZWQuCglJIHdvdWxkIHBl
cnNvbmFsbHkga2VlcCBpc19oYXJkbG9ja3VwKCkuIEl0IGlzIHN0YXRpYy4KCUFuZCBpdCB3aWxs
IGJlIGNvbnNpdGVudCB3aXRoIGlzX3NvZnRsb2NrdXAoKS4KCiAgKyB3YXRjaGRvZ19oYXJkbG9j
a3VwX2ludGVycnVwdF9jb3VudCgpIGxvb2tzIGJldHRlciB0aGVuCgl0aGUgb3JpZ2luYWwuIEl0
IGNsZWFybHkgc2hvd3MgdGhhdCBpdCBtYWtlcyBzZW5zZSBvbmx5Cglmb3IgdGhlIGhhcmRsb2Nr
dXAgZGV0ZWN0b3IgKCJidWciIGZpeGVkIGJ5IHRoaXMgcGF0Y2gpLgoKCVdlbGwsIEkgd291bGQg
cGVyc29uYWxseSBjYWxsIGl0IHdhdGNoZG9nX2hhcmRsb2NrdXBfa2ljaygpCglhbmQgcmVtb3Zl
IHRoZSBjb21tZW50LgoKClRoYXQgc2FpZCwgSSBjb3VsZCBsaXZlIHdpdGggdGhpcyBwYXRjaC4g
SXQgaXMgYmV0dGVyIHRoYW4gdGhlCm9yaWdpbmFsLgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBv
cnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
