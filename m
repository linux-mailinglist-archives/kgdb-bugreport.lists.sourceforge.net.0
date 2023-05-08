Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AE56FC7B1
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBs-0007cU-9V
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pvpmQ-0003Kc-Sm
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 01:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:From:Subject:Cc:To:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=; b=RRRzu3SEWVasQfr22BIONPlnWx
 Si48WYq9ObgW5d2XdvoI5491T7p+44paOWnYMUHPVDXtMcv0Skjy0ZQGqaWH3OqhRazWr8J9S7hOZ
 t1x49so0Zf3Javyhcbb6ChQPGiyEfVprMuObMvry6fg/EdvQt5/ax4sxG+qchceBGBSk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=; b=OlcRT/Tcbq0cyP3PAAuyKmCwYY
 eSJ80et87pagMezjf3U2jQooOTSMjhFad9htS71xWGc/CopRXjF0bNz+Z1sF1P8AZfB+LVu5DMgTB
 QjGnQxyrzGofRHszxvvGLVSgSP1fER7H5eNMVeJCB2dIbISVy0nVgLDZ+aCQlg8nhzgI=;
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pvpmQ-0006p9-Kj for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 01:35:11 +0000
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-24e3b69bc99so2786344a91.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 07 May 2023 18:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683509705; x=1686101705;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=;
 b=L14pxpyy1Yc8+HiewNaTQb+1joh8hYSOP3/eSCWmsTMJDnd6785STORT8kwjkGo2Se
 0i8+WagpXa8hJmR6t/LT7/sRKpmf+/KhkH0cbQcr2O6uaSzqM3ZscCvvnujixJA1Ohtz
 +TDocKRxq9Z7oFDz3JTmqk+qGJoW7sLBtQtnhjtT1o4Jbh/kSUAEi1DayHu/qBKsz9g0
 OpLBg/55IJVmGITHmhJsf02wK5FPOZWzon9TAgZuxFxmSXGX2tWCWkv+4B/RWRpA1i4X
 sWQkpWNXRRqS1ceEPdkUmdpxnwjVOPZRPR/xEDB1D4aX3s85+ine5OJy93J2i3tU985P
 Pejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683509705; x=1686101705;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HU/mjP7Ap3TZEbMspJ2h6V5QMnaNP2Fmf0Z6DZ7aqHE=;
 b=BKmdYFx9P661QQqFgr13cFbGKTprYU6GHxWnVfr8F9yI3st5mcRNbPJmKyBOYvw+O1
 2lCPgQixUvRZMxEzsdHErj6nsuJhb5qFb7jQaCLSxhxIO64evtlH8MnoF/JBptGbFU34
 c6NmcHk5eHWIoylfLSHNsleO2eAlVBYhSj8Id1qcJnhh9gTnIbxURj8a2KCRPdjDfsDf
 GOujQ1n5V72rb76C+tbh/9LQLcZ1BNX5SdmG5iPOhQdbpFgrGod2ZVxoG/22OJuzM6uY
 4c/B0EHxuqoOlVZJhUmn7efXak++GYWgxf5sPaWpSIL1zpq+wnjjkZ3eji+tVS5IGwyq
 /dQA==
X-Gm-Message-State: AC+VfDwQQJ566TSjuFk4t1K1dB3NMO+s5TJyYu9T+AC5O7/PKMAsWrYP
 j7zBQZFJgt0d1Jnh6Xo0iyM=
X-Google-Smtp-Source: ACHHUZ7wpMgBNBiHQoh+RV3/6p2Xa+RAutLvbhq2Sce/KNFSy1fHPppI+Mwi880EABIulXrieqwNrA==
X-Received: by 2002:a17:90b:19ce:b0:24e:1177:f467 with SMTP id
 nm14-20020a17090b19ce00b0024e1177f467mr9325645pjb.12.1683509704923; 
 Sun, 07 May 2023 18:35:04 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902968e00b001a4edbabad3sm5814967plp.230.2023.05.07.18.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 18:35:04 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 08 May 2023 11:34:49 +1000
Message-Id: <CSGIDMMFXIVH.3SFPYD19Y5WQX@wheely>
To: "Doug Anderson" <dianders@chromium.org>
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
 <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat May 6, 2023 at 2:37 AM AEST, Doug Anderson wrote: >
    Hi, > > On Thu, May 4, 2023 at 7:51 PM Nicholas Piggin wrote: > > > > On
    Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: > > > I [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.54 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [npiggin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvpmQ-0006p9-Kj
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net,
 ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>,
 sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Andi Kleen <ak@linux.intel.com>, mpe@ellerman.id.au,
 christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Pingfan
 Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gU2F0IE1heSA2LCAyMDIzIGF0IDI6MzcgQU0gQUVTVCwgRG91ZyBBbmRlcnNvbiB3cm90ZToK
PiBIaSwKPgo+IE9uIFRodSwgTWF5IDQsIDIwMjMgYXQgNzo1MeKAr1BNIE5pY2hvbGFzIFBpZ2dp
biA8bnBpZ2dpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSBNYXkgNSwgMjAyMyBh
dCA4OjEzIEFNIEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiA+IEluIHByZXBhcmF0
aW9uIGZvciB0aGUgYnVkZHkgaGFyZGxvY2t1cCBkZXRlY3RvciwgcmVuYW1lCj4gPiA+IHRvdWNo
X25taV93YXRjaGRvZygpIHRvIHRvdWNoX2hhcmRsb2NrdXBfd2F0Y2hkb2coKSB0byBtYWtlIGl0
IGNsZWFyCj4gPiA+IHRoYXQgaXQgd2lsbCB0b3VjaCB3aGF0ZXZlciBoYXJkbG9ja3VwIGRldGVj
dG9yIGlzIGNvbmZpZ3VyZWQuIFdlJ2xsCj4gPiA+IGFkZCBhICNkZWZpbmUgZm9yIHRoZSBvbGQg
bmFtZSAodG91Y2hfbm1pX3dhdGNoZG9nKSBzbyB0aGF0IHdlIGRvbid0Cj4gPiA+IGhhdmUgdG8g
dG91Y2ggZXZlcnkgcGllY2Ugb2YgY29kZSByZWZlcnJpbmcgdG8gdGhlIG9sZCBuYW1lLgo+ID4K
PiA+IElzIHRoaXMgcmVhbGx5IGhlbHBmdWw/IE5vdyBpdCdzIGdvdCB0d28gbmFtZXMgQ291bGQg
anVzdCBsZWF2ZSBpdC4KPiA+IElmIHlvdSBpbnNpc3QgdGhlbiBpdCdkIGJlIGJldHRlciBqdXN0
IHRvIHJlbmFtZSBldmVyeXRoaW5nIGluIG9uZQo+ID4gZ28gYXQgdGhlIGVuZCBvZiBhIG1lcmdl
IHdpbmRvdyBJTU8uIENvbmZsaWN0cyB3b3VsZCBiZSB0cml2aWFsLgo+Cj4gSSdtIG5vdCBwaWNr
eSBoZXJlLiBJIGNoYW5nZWQgdGhlIG5hbWUgc2luY2UgUGV0ciByZXF1ZXN0ZWQgbmFtZXMgdG8K
PiBiZSBjaGFuZ2VkIGZvciBhbnkgY29kZSBJIHdhcyB0b3VjaGluZyBbMV0gYW5kIHNvIEkgdGhy
ZXcgdGhpcyBvdXQgYXMKPiBhIHByb3Bvc2FsLiBJIGFncmVlIHRoYXQgaGF2aW5nIHR3byBuYW1l
cyBjYW4gYmUgY29uZnVzaW5nLCBidXQgaW4KPiB0aGlzIGNhc2UgaXQgZGlkbid0IGZlZWwgdG9v
IHRlcnJpYmxlIHRvIG1lLgo+Cj4gSSdkIGxvdmUgdG8gaGVhciBQZXRyJ3Mgb3BpbmlvbiBvbiB0
aGlzIG5hbWUgY2hhbmdlLiBJJ20gaGFwcHkgd2l0aDoKPgo+IGEpIFRoaXMgcGF0Y2ggYXMgaXQg
aXMuCj4KPiBiKSBEcm9wcGluZyB0aGlzIHBhdGNoIChvciBwZXJoYXBzIGp1c3QgY2hhbmdpbmcg
aXQgdG8gYWRkIGNvbW1lbnRzKS4KPgo+IGMpIENoYW5naW5nIHRoaXMgcGF0Y2ggdG8gcmVuYW1l
IGFsbCA3MCB1c2VzIG9mIHRoZSBvbGQgbmFtZS4gQXNzdW1pbmcKPiB0aGlzIHdpbGwgZ28gdGhy
b3VnaCBBbmRyZXcgTW9ydG9uJ3MgdHJlZSwgSSdkIGJlIGludGVyZXN0ZWQgaW4KPiB3aGV0aGVy
IGhlJ3MgT0sgdy8gdGhpcy4KPgo+IGQpIERyb3BwaW5nIHRoaXMgcGF0Y2ggZnJvbSB0aGlzIHNl
cmllcyBidXQgcHV0dGluZyBpdCBvbiB0aGUKPiBiYWNrYnVybmVyIHRvIHRyeSB0byBkbyBsYXRl
ciAoc28gdGhhdCB0aGUgcmVuYW1lIGNhbiBoYXBwZW4gYXQgYSB0aW1lCj4gd2hlbiBpdCdzIGxl
YXN0IGRpc3J1cHRpdmUpLgo+Cj4KPiA+ID4gSWRlYWxseSB0aGlzIGNoYW5nZSB3b3VsZCBhbHNv
IHJlbmFtZSB0aGUgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKSwKPiA+ID4gYnV0IHRoYXQgaXMg
aGFyZGVyIHNpbmNlIGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkgaXMgZXhwb3J0ZWQgd2l0aAo+
ID4gPiBFWFBPUlRfU1lNQk9MKCkgYW5kIHRodXMgaXMgQUJJLiBBZGQgYSBjb21tZW50IG5leHQg
dG8gdGhlIGNhbGwgdG8KPiA+ID4gaG9wZWZ1bGx5IGFsbGV2aWF0ZSBzb21lIG9mIHRoZSBjb25m
dXNpb24gaGVyZS4KPiA+Cj4gPiBXZSBkb24ndCBrZWVwIEFCSSBmaXhlZCB1cHN0cmVhbS4KPgo+
IEknbSBoYXBweSB0byBiZSBjb3JyZWN0ZWQsIGJ1dCBteSB1bmRlcnN0YW5kaW5nIHdhcyB0aGF0
IGtlcm5lbCBkZXZzCj4gbWFkZSBhbiBlZmZvcnQgbm90IHRvIG1lc3Mgd2l0aCB0aGluZ3MgZXhw
b3J0ZWQgdmlhICJFWFBPUlRfU1lNQk9MIiwKPiBidXQgdGhpbmdzIGV4cG9ydGVkIHZpYSAiRVhQ
T1JUX1NZTUJPTF9HUEwiIHdlcmUgZmFpciBnYW1lLgoKSSBkb24ndCB0aGluayB0aGF0J3MgdGhl
IGNhc2UuIElmIGFueXRoaW5nIHBlb3BsZSBtaWdodCBiZSBhIGJpdCBtb3JlCmluY2xpbmVkIHRv
IGFjY29tbW9kYXRlIEdQTCBleHBvcnRzIGZvciBvdXQgb2YgdHJlZSBtb2R1bGVzIHRoYXQgdXNl
CnRoZW0uCgo+IEkgZ3Vlc3MgbWF5YmUgbXkgcGF0Y2ggY2FsbGluZyBpdCAiQUJJIiBpcyBhIHN0
cm9uZ2VyIHN0YXRlbWVudCB0aGFuCj4gdGhhdCwgdGhvdWdoLiBEb2luZyBhIGxpdHRsZSBtb3Jl
IHJlc2VhcmNoLCBub2JvZHkgd2FudHMgdG8gc2F5IHRoYXQKPiB0aGluZ3MgZXhwb3J0ZWQgd2l0
aCAiRVhQT1JUX1NZTUJPTCIgYXJlIEFCSSwgdGhleSBqdXN0IHdhbnQgdG8gc2F5Cj4gdGhhdCB3
ZSBtYWtlIGFuIGVmZm9ydCB0byBoYXZlIHRoZW0gYmUgbW9yZSBzdGFibGUuCgpXZSB3b3VsZG4n
dCBicmVhayBhbnkgc3ltYm9sIGZvciBubyByZWFzb24sIGJ1dCBpbiB0aGlzIGNhc2UgdGhlcmUg
aXMgYQpnb29kIHJlYXNvbi4gSWYgdGhlIG5hbWUgY2hhbmdlIGlzIGltcG9ydGFudCBmb3IgY2xh
cml0eSB0aGVuIHdlIGNoYW5nZQppdC4gQW5kIHRoaXMgaXMgYWJvdXQgdGhlIGVhc2llc3QgY2hh
bmdlIGZvciBhbiBvdXQgb2YgdHJlZSBtb2R1bGUgdG8KZGVhbCB3aXRoLCBzbyBpdCBzaG91bGQg
YmUgbm8gYmlnIGRlYWwgZm9yIHRoZW0uCgpUaGFua3MsCk5pY2sKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxp
c3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
