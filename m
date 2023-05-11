Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB76FEEB2
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 11:24:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px2XV-0003hN-If
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 09:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px2XT-0003hH-V1
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 09:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3x+A1oAvkOFARznkC50c0SLUXNmMY3RdCi2ozgXXvgw=; b=R/IwsM8Hqy25OfKTkksssJsyd0
 xgLTZLbVmu5mLp6ggzrcEHBlJM0xyG9cTUQr3FknRQ+6z8dTDFV7Jf1QQWS9v9r5TNaAh+bXTe1cq
 ClJj7dlCdsKBPx1OuH20GEkWO/++xpszw5AhvA6Y6ryqTzVi9VbTFj3pLWE6jESs/p+s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3x+A1oAvkOFARznkC50c0SLUXNmMY3RdCi2ozgXXvgw=; b=HHnRrL0LsywVJI7MneKCSyMBv8
 Xp3PEcxNqE2wzyllBTgf/3S0zMeEz8k1FK4wbBeBL1JSaJsVVtO25+v0RKp8yaqKdjEL58+LEjJrn
 lvU5tfVKn5k7RjPreaYZrkL3OGQAjJlw1yKyReyx8e0rbzFst1hyR2XJR+YluvED0OG0=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px2XQ-00391M-1K for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 09:24:43 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0BD4A219EB;
 Thu, 11 May 2023 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683797072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3x+A1oAvkOFARznkC50c0SLUXNmMY3RdCi2ozgXXvgw=;
 b=f/46rLYe7nyx5+kH1sYpIAw20pQoZZ4k+Ask8EvmsmiWBbtNmUShXHyprr6FXGe31OW383
 tKjPbpzXi9nwMp5HsjAkNXfozdukoqdCei/XT/10RlTfaTVyada91hl3TnVvYiIg9PrxY7
 ZOTKjflhV/IQZ/2lqefV+OAZ6FjZ7Dg=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9D6172C141;
 Thu, 11 May 2023 09:24:30 +0000 (UTC)
Date: Thu, 11 May 2023 11:24:29 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZFy0TX1tfhlH8gxj@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
 <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 2023-05-05 09:37:35, Doug Anderson wrote: > Hi, > >
    On Thu, May 4, 2023 at 7:51 PM Nicholas Piggin <npiggin@gmail.com> wrote:
    > > > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrot [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1px2XQ-00391M-1K
Subject: Re: [Kgdb-bugreport] [PATCH v4 05/17] watchdog/hardlockup: Rename
 touch_nmi_watchdog() to touch_hardlockup_watchdog()
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

T24gRnJpIDIwMjMtMDUtMDUgMDk6Mzc6MzUsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBNYXkgNCwgMjAyMyBhdCA3OjUx4oCvUE0gTmljaG9sYXMgUGlnZ2luIDxucGln
Z2luQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpIE1heSA1LCAyMDIzIGF0IDg6MTMg
QU0gQUVTVCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gSW4gcHJlcGFyYXRpb24gZm9y
IHRoZSBidWRkeSBoYXJkbG9ja3VwIGRldGVjdG9yLCByZW5hbWUKPiA+ID4gdG91Y2hfbm1pX3dh
dGNoZG9nKCkgdG8gdG91Y2hfaGFyZGxvY2t1cF93YXRjaGRvZygpIHRvIG1ha2UgaXQgY2xlYXIK
PiA+ID4gdGhhdCBpdCB3aWxsIHRvdWNoIHdoYXRldmVyIGhhcmRsb2NrdXAgZGV0ZWN0b3IgaXMg
Y29uZmlndXJlZC4gV2UnbGwKPiA+ID4gYWRkIGEgI2RlZmluZSBmb3IgdGhlIG9sZCBuYW1lICh0
b3VjaF9ubWlfd2F0Y2hkb2cpIHNvIHRoYXQgd2UgZG9uJ3QKPiA+ID4gaGF2ZSB0byB0b3VjaCBl
dmVyeSBwaWVjZSBvZiBjb2RlIHJlZmVycmluZyB0byB0aGUgb2xkIG5hbWUuCj4gPgo+ID4gSXMg
dGhpcyByZWFsbHkgaGVscGZ1bD8gTm93IGl0J3MgZ290IHR3byBuYW1lcyBDb3VsZCBqdXN0IGxl
YXZlIGl0Lgo+ID4gSWYgeW91IGluc2lzdCB0aGVuIGl0J2QgYmUgYmV0dGVyIGp1c3QgdG8gcmVu
YW1lIGV2ZXJ5dGhpbmcgaW4gb25lCj4gPiBnbyBhdCB0aGUgZW5kIG9mIGEgbWVyZ2Ugd2luZG93
IElNTy4gQ29uZmxpY3RzIHdvdWxkIGJlIHRyaXZpYWwuCj4gCj4gSSdtIG5vdCBwaWNreSBoZXJl
LiBJIGNoYW5nZWQgdGhlIG5hbWUgc2luY2UgUGV0ciByZXF1ZXN0ZWQgbmFtZXMgdG8KPiBiZSBj
aGFuZ2VkIGZvciBhbnkgY29kZSBJIHdhcyB0b3VjaGluZyBbMV0gYW5kIHNvIEkgdGhyZXcgdGhp
cyBvdXQgYXMKPiBhIHByb3Bvc2FsLiBJIGFncmVlIHRoYXQgaGF2aW5nIHR3byBuYW1lcyBjYW4g
YmUgY29uZnVzaW5nLCBidXQgaW4KPiB0aGlzIGNhc2UgaXQgZGlkbid0IGZlZWwgdG9vIHRlcnJp
YmxlIHRvIG1lLgoKSU1ITywgaXQgaXMgd29ydGggcmVuYW1pbmcgdG8gbWFrZSB0aGUgY29kZSBl
YXNpZXIgdG8gZm9sbG93LgpFc3BlY2lhbGx5IGFmdGVyIGFkZGluZyB0aGUgYnVkZHkgaGFyZGxv
Y2t1cCBkZXRlY3RvciB0aGF0IGlzCm5vdCB1c2luZyBOTUkgY29udGV4dC4KCkFuZCBJIGFncmVl
IHRoYXQgdGhhdCB3ZSBzaG91bGQgcmVuYW1lIGFsbCBjYWxsZXJzIGFzIHdlbGwuCk90aGVyd2lz
ZSwgaXQgbWlnaHQgYmUgc2VlbiBqdXN0IGFzIGFuIGV4dHJhIGNodXJuLgoKPiBJJ2QgbG92ZSB0
byBoZWFyIFBldHIncyBvcGluaW9uIG9uIHRoaXMgbmFtZSBjaGFuZ2UuIEknbSBoYXBweSB3aXRo
Ogo+IAo+IGEpIFRoaXMgcGF0Y2ggYXMgaXQgaXMuCj4gCj4gYikgRHJvcHBpbmcgdGhpcyBwYXRj
aCAob3IgcGVyaGFwcyBqdXN0IGNoYW5naW5nIGl0IHRvIGFkZCBjb21tZW50cykuCj4gCj4gYykg
Q2hhbmdpbmcgdGhpcyBwYXRjaCB0byByZW5hbWUgYWxsIDcwIHVzZXMgb2YgdGhlIG9sZCBuYW1l
LiBBc3N1bWluZwo+IHRoaXMgd2lsbCBnbyB0aHJvdWdoIEFuZHJldyBNb3J0b24ncyB0cmVlLCBJ
J2QgYmUgaW50ZXJlc3RlZCBpbgo+IHdoZXRoZXIgaGUncyBPSyB3LyB0aGlzLgo+IAo+IGQpIERy
b3BwaW5nIHRoaXMgcGF0Y2ggZnJvbSB0aGlzIHNlcmllcyBidXQgcHV0dGluZyBpdCBvbiB0aGUK
PiBiYWNrYnVybmVyIHRvIHRyeSB0byBkbyBsYXRlciAoc28gdGhhdCB0aGUgcmVuYW1lIGNhbiBo
YXBwZW4gYXQgYSB0aW1lCj4gd2hlbiBpdCdzIGxlYXN0IGRpc3J1cHRpdmUpLgoKZCkgc291bmRz
IHJlYXNvbmFibGUgZ2l2ZW4gdGhhdCB0aGVyZSBpcyBhYm91dCA3MCBjYWxsZXJzLgoKPiAKPiA+
ID4gSWRlYWxseSB0aGlzIGNoYW5nZSB3b3VsZCBhbHNvIHJlbmFtZSB0aGUgYXJjaF90b3VjaF9u
bWlfd2F0Y2hkb2coKSwKPiA+ID4gYnV0IHRoYXQgaXMgaGFyZGVyIHNpbmNlIGFyY2hfdG91Y2hf
bm1pX3dhdGNoZG9nKCkgaXMgZXhwb3J0ZWQgd2l0aAo+ID4gPiBFWFBPUlRfU1lNQk9MKCkgYW5k
IHRodXMgaXMgQUJJLiBBZGQgYSBjb21tZW50IG5leHQgdG8gdGhlIGNhbGwgdG8KPiA+ID4gaG9w
ZWZ1bGx5IGFsbGV2aWF0ZSBzb21lIG9mIHRoZSBjb25mdXNpb24gaGVyZS4KPiA+Cj4gPiBXZSBk
b24ndCBrZWVwIEFCSSBmaXhlZCB1cHN0cmVhbS4KPiAKPiBJJ20gaGFwcHkgdG8gYmUgY29ycmVj
dGVkLCBidXQgbXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBrZXJuZWwgZGV2cwo+IG1hZGUgYW4g
ZWZmb3J0IG5vdCB0byBtZXNzIHdpdGggdGhpbmdzIGV4cG9ydGVkIHZpYSAiRVhQT1JUX1NZTUJP
TCIsCj4gYnV0IHRoaW5ncyBleHBvcnRlZCB2aWEgIkVYUE9SVF9TWU1CT0xfR1BMIiB3ZXJlIGZh
aXIgZ2FtZS4KCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBrZXJuZWwgZ3VhcmFudGVlcyBBQkkg
Y29tcGF0aWJpbGl0eSBvbmx5IGZvcgp0aGUgdXNlcnNwYWNlIChkby1ub3QtYnJlYWstdXNlcnNw
YWNlIHJ1bGUpLiBCdXQgdGhlIGtlcm5lbCBBQkkKaXMgbm90IGd1YXJhbnRlZWQgWypdCgpJdCBh
Y3R1YWxseSBoYXMgZXZlbiBhIHBvc2l0aXZlIHNpZGUgZWZmZWN0IGJlY2F1c2UgaXQgbW90aXZh
dGVzCm1vZHVsZSBkZXZlbG9wZXJzIHRvIHVwc3RyZWFtIHRoZSBjb2RlLgoKT2YgY291cnNlLCB0
aGVyZSBzaG91bGQgYmUgYSBnb29kIHJlYXNvbiBmb3IgdGhlIGNoYW5nZS4gQW5kIEkgdGhpbmsK
dGhhdCB3ZSBoYXZlIGEgZ29vZCByZWFzb24uCgpbKl0gVGhpcyBpcyB2YWxpZCBmb3IgdXBzdHJl
YW0uIEFub3RoZXIgc3RvcnkgaXMgd2l0aCBsaW51eAogICAgZGlzdHJpYnV0aW9ucy4gVGhleSB1
c3VhbGx5IG1haW50YWluIHRoZSBrZXJuZWwgS0FCSQogICAgc3RhYmlsaXR5IHRvIHNvbWUgZGVn
cmVlIHdoZW4gYmFja3BvcnRpbmcgdXBzdHJlYW0gY2hhbmdlcy4KCkJlc3QgUmVnYXJkcywKUGV0
cgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGIt
YnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdy
ZXBvcnQK
