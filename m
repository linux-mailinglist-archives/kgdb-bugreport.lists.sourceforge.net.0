Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FEB6FF1C5
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 11 May 2023 14:46:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1px5gF-0007nt-Ki
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 11 May 2023 12:45:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1px5gE-0007nn-B2
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 12:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9QB/4NQfxs6MWzEb4+Nqls4LUd5AWkLgrCPKn/rdQXM=; b=fv+If5W4uvfsQiGBkcUblP8Sb7
 cC+IAkJdTxEJ0DlXzwvdKW4vGJYb9R7qQk1kuw8Qy9yLcAUWO35KWl8zSGhLa1DOfToT161hyn+dk
 JCUWjzsfxCkJtHcvtmLENLNajh+5Mm8iYLuqPOJ1KGAX1Ttq4f4tI9L0aho7Yyhpafvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9QB/4NQfxs6MWzEb4+Nqls4LUd5AWkLgrCPKn/rdQXM=; b=LNkZuXVmAzKziWw7BQpBGvzWzd
 xvdCFhK/lFXsqJSG1YfvbFryMsAbc6S/oOKEYAcm49chONrgzN6R3Cw8HwUAl0iHXpG7f2TY9fLE9
 TNYy+SmFsXHirv7VaahS3WGitw6bc9i3ev1WDQa5d1QoZqbwmDraOK7oon+GEHop87VE=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1px5gC-003Lo7-9B for kgdb-bugreport@lists.sourceforge.net;
 Thu, 11 May 2023 12:45:58 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E882D1FE81;
 Thu, 11 May 2023 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1683809149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QB/4NQfxs6MWzEb4+Nqls4LUd5AWkLgrCPKn/rdQXM=;
 b=XHA7oE6mmCQVIyRFnHnwTxvsSvoMrqGwBeCZ1Y/UJ/YR+kR0CRB7zHy4Ed8vNjlnVuzLG3
 eFY8NJqs6DJA8SwBXvMchJIC0fvt24EmFidUVZ4kKuCrZxZjAMKJm1OxKXot92GupgIZsm
 bPTlKL8UJUfRozLbl/SROqJsU8Tfifs=
Received: from suse.cz (unknown [10.100.201.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A80F82C141;
 Thu, 11 May 2023 12:45:48 +0000 (UTC)
Date: Thu, 11 May 2023 14:45:48 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZFzjfK3QGCCTB-Pw@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
 <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
 <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vuad+gxrUirhyx8aFuLbh2M1hMnoY5NUVBxdycd8kFiQ@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri 2023-05-05 09:38:14, Doug Anderson wrote: > Hi, > >
    On Thu, May 4, 2023 at 8:02 PM Nicholas Piggin <npiggin@gmail.com> wrote:
    > > > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrot [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1px5gC-003Lo7-9B
Subject: Re: [Kgdb-bugreport] [PATCH v4 08/17] watchdog/hardlockup: Style
 changes to watchdog_hardlockup_check() / ..._is_lockedup()
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

T24gRnJpIDIwMjMtMDUtMDUgMDk6Mzg6MTQsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gVGh1LCBNYXkgNCwgMjAyMyBhdCA4OjAy4oCvUE0gTmljaG9sYXMgUGlnZ2luIDxucGln
Z2luQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpIE1heSA1LCAyMDIzIGF0IDg6MTMg
QU0gQUVTVCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+ID4gVGhlc2UgYXJlIHRpbnkgc3R5
bGUgY2hhbmdlczoKPiA+ID4gLSBBZGQgYSBibGFuayBsaW5lIGJlZm9yZSBhICJyZXR1cm4iLgo+
ID4gPiAtIFJlbmFtZXMgdHdvIGdsb2JhbHMgdG8gdXNlIHRoZSAid2F0Y2hkb2dfaGxkIiBwcmVm
aXguCj4gPgo+ID4gUGFydGljdWxhcmx5IHN0YXRpYyBvbmVzIGRvbid0IHJlYWxseSBuZWVkIHRo
ZSBuYW1lc3BhY2UgcHJlZml4ZXMuCj4gCj4gUmVuYW1lcyBhcmUgbW9zdGx5IGF0IFBldHIncyBy
ZXF1ZXN0LiBJZiBJJ3ZlIG1pc3VuZGVyc3Rvb2Qgd2hhdCBoZQo+IHdhbnRzIGhlcmUgdGhhdCBJ
J20gaGFwcHkgdG8gcmVtb3ZlIHRoZW0uCgpJTUhPLCB0aGUgbmFtZXNwYWNlIHByZWZpeCBtYWtl
cyBzZW5zZSBoZXJlIHRvIGRpc3Rpbmd1aXNoIGhhcmRsb2NrdXAKYW5kIHNvZnRsb2NrdXAgc3Bl
Y2lmaWMgY29kZS4gVGhlIG9yaWdpbmFsIG5hbWVzIGRpZCB0aGlzIGFzIHdlbGwKYnV0IHRoZXkg
d2VyZSBhbm90aGVyIHZhcmlhbnRzIG9mIHRoZSBuYW1pbmcgc2NoZW1lIG1lc3MuCgpJTUhPLCBl
dmVuIGxvbmdlciBwcmVmaXggaXMgYmV0dGVyIHRoYW4gYSBtZXNzLgoKPiA+IE5vdCBzdXJlIGlm
IHByb2Nlc3NlZCBpcyBiZXR0ZXIgdGhhbiB3YXJuLgo+IAo+IEkgY2FuIHVuZG8gdGhpcyBvbmUg
aWYgeW91IHdhbnQuIEl0IGZlbHQgbGlrZSB3ZSB3ZXJlIGRvaW5nIG1vcmUgdGhhbgo+IGp1c3Qg
d2FybmluZywgYnV0IGlmIHBlb3BsZSB0aGluayAid2FybiIgaXMgYSBiZXR0ZXIgd2F5IHRvIGRl
c2NyaWJlCj4gaXQgdGhlbiB0aGF0J3MgZmluZSB3aXRoIG1lLgoKVGhlIGNvZGUgc2VlbXMgdG8g
b25seSBwcmludCB0aGUgd2FybmluZyBhbmQgZHVtcCBhIGxvdCBvZiBkZWJ1ZwppbmZvcm1hdGlv
bi4gQm90aCBfd2FybmVkIG9yIF9wcm9jZXNzZWQgbG9vayBnb29kIHRvIG1lLgoKPiA+IGFsbGNw
dV9kdW1wZWQgaXMgYmV0dGVyCj4gPiB0aGFuIGR1bXBlZF9zdGFja3MgdGhvdWdoIGJlY2F1c2Ug
dGhlIGFsbC1DUFVzLWR1bXAgaXMgYSBwYXJ0aWN1bGFyCj4gPiB0aGluZy4KPgo+IE9LLCBJIGNh
biB1bmRvIHRoaXMgYW5kIGxlYXZlIGl0IGFzICJhbGxjcHVfZHVtcGVkIi4KCkkgZG8gbm90IGhh
dmUgc3Ryb25nIG9waW5pb24uIFdlbGwsICJhbGxjcHUiIGlzIGFub3RoZXIgaW5jb25zaXN0ZW5j
eQp2cy4gImFsbF9jcHUiIGluIHN5c2N0bF9oYXJkbG9ja3VwX2FsbF9jcHVfYmFja3RyYWNlLiBT
bywgaXQgc2hvdWxkCmJlICJhbGxfY3B1X2R1bXBlZCIuCgpGZWVsIGZyZWUgdG8gdXNlOgoKUmV2
aWV3ZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgoKQmVzdCBSZWdhcmRzLApQ
ZXRyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dk
Yi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1
Z3JlcG9ydAo=
