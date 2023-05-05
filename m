Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B02346F86E3
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 18:38:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puyRW-0003Jp-GS
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 May 2023 16:38:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puyRV-0003Ja-EL
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=; b=P2QWY/f8NnTJSj5P+NFeYi7lOc
 ImNnebFCWXwAH7HS35B0b9LZ8J6NXHv4PYqo0TqoNIuRD/ZX4BYNfkrU0+TX3XjjotfHVFaGlhLOj
 EdTDcZe2kmnLzm7SUPIOxkFpnf4orITaT7EjEHS/hcvsdsHjgGZCgrUbw8ZilxWMU498=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=; b=grluBXmyDdQWySxULTSODcqy32
 EOS0B+s4Oc8YTWwnjMLRgAxrIn7DgKKIpklsoK9oqFFZTZo4ynYgd2RKbvaP2yuvJaZ8AsdAL0LW0
 n6dRDK7pjrKqQD/pECVBnEgbEk9FhCNroZH04CYhZJVRl8FTXSWcFL3ZhEQpRe7ybx8c=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puyRR-0007Si-TP for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:01 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-3ef35d44612so20175471cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683304670; x=1685896670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=;
 b=CMsm/LqGEAj+s7CIDExkm9nhwDFeJQDa+Oeq9fVS2Bmq3gS2DMH4rbkFfJstSWSWVJ
 sE6rFmodbvgtKNrRH1DIZUJNoyIpRSrlkmD5UQQ1e0/L6pdn3226k8bNu4IsYNMmUJHT
 StGBLiDqJmtf8Cr0AU5QJCiTcVq+LrUiMT5JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304670; x=1685896670;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+yj1n8SZYpHx6GcDEfBZNc+Nz+lwlz9tugCt27cvkK8=;
 b=NcEoROME2huUaZkkrp6t9VN20REwML9ohy10xshdObATcD30RqLnaujyXLgWNNW4QL
 uDwYFBI3ahjMTO65l97rqMFN23exvpMXykJU9qtzVqwcQewe6ofIcFgYD5lq3xYzKzZp
 tIkvXoLXd4h5aihcTVjGJqyZDHwjBVtoX45SeRnzTM1OklA8dN0JcQbGm2utVKxBzdPv
 nzEC5QmontdK6gv1zinwECDu86+2IulcvX6d9t1axfjCEeeBcJjzdCb8AWZX0VG16AC5
 tVpIk9J86dHsDnwLkQ+F+aj/cDLwDcCgZCeOtCUGAd9H7ubkgbqX9jBtBwnN5jSz6TYS
 CjTA==
X-Gm-Message-State: AC+VfDzjm2PrfitKLA1DHl5Eucz16vkicPUKuGyYRshRCoiCq2vV4Vaa
 f63o+r7MOHdvH8VqEbxngF8qgDzWuu7xazaHtFk=
X-Google-Smtp-Source: ACHHUZ596n8KEUCsM0ujHl2kTgdonnLqYVcdVsWMInRjdkE1avelL3+nCbJkN8AJsZgWUr1dLJNi6w==
X-Received: by 2002:ac8:5f52:0:b0:3ef:5f95:8365 with SMTP id
 y18-20020ac85f52000000b003ef5f958365mr2969787qta.42.1683304670355; 
 Fri, 05 May 2023 09:37:50 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 a30-20020aed279e000000b003ef231cceeasm733755qtd.23.2023.05.05.09.37.49
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:37:49 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-3ef34c49cb9so1091971cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:37:49 -0700 (PDT)
X-Received: by 2002:a05:622a:206:b0:3db:1c01:9d95 with SMTP id
 b6-20020a05622a020600b003db1c019d95mr335755qtx.4.1683304668543; Fri, 05 May
 2023 09:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.5.I4e47cbfa1bb2ebbcdb5ca16817aa2887f15dc82c@changeid>
 <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
In-Reply-To: <CSE04EI159N2.2TSXHBN2QLFCM@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:37:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
Message-ID: <CAD=FV=XXzo3m2dqwtNST+uXGQz6NW_e-B6-tWkJMrHoCTZBT9Q@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 4, 2023 at 7:51 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: >
   > In preparation for the buddy hardlockup detector, rename [...] 
 
 Content analysis details:   (-0.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.171 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puyRR-0007Si-TP
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 mpe@ellerman.id.au, christophe.leroy@csgroup.eu, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDc6NTHigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSBNYXkgNSwgMjAyMyBhdCA4OjEzIEFN
IEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiBmb3IgdGhl
IGJ1ZGR5IGhhcmRsb2NrdXAgZGV0ZWN0b3IsIHJlbmFtZQo+ID4gdG91Y2hfbm1pX3dhdGNoZG9n
KCkgdG8gdG91Y2hfaGFyZGxvY2t1cF93YXRjaGRvZygpIHRvIG1ha2UgaXQgY2xlYXIKPiA+IHRo
YXQgaXQgd2lsbCB0b3VjaCB3aGF0ZXZlciBoYXJkbG9ja3VwIGRldGVjdG9yIGlzIGNvbmZpZ3Vy
ZWQuIFdlJ2xsCj4gPiBhZGQgYSAjZGVmaW5lIGZvciB0aGUgb2xkIG5hbWUgKHRvdWNoX25taV93
YXRjaGRvZykgc28gdGhhdCB3ZSBkb24ndAo+ID4gaGF2ZSB0byB0b3VjaCBldmVyeSBwaWVjZSBv
ZiBjb2RlIHJlZmVycmluZyB0byB0aGUgb2xkIG5hbWUuCj4KPiBJcyB0aGlzIHJlYWxseSBoZWxw
ZnVsPyBOb3cgaXQncyBnb3QgdHdvIG5hbWVzIENvdWxkIGp1c3QgbGVhdmUgaXQuCj4gSWYgeW91
IGluc2lzdCB0aGVuIGl0J2QgYmUgYmV0dGVyIGp1c3QgdG8gcmVuYW1lIGV2ZXJ5dGhpbmcgaW4g
b25lCj4gZ28gYXQgdGhlIGVuZCBvZiBhIG1lcmdlIHdpbmRvdyBJTU8uIENvbmZsaWN0cyB3b3Vs
ZCBiZSB0cml2aWFsLgoKSSdtIG5vdCBwaWNreSBoZXJlLiBJIGNoYW5nZWQgdGhlIG5hbWUgc2lu
Y2UgUGV0ciByZXF1ZXN0ZWQgbmFtZXMgdG8KYmUgY2hhbmdlZCBmb3IgYW55IGNvZGUgSSB3YXMg
dG91Y2hpbmcgWzFdIGFuZCBzbyBJIHRocmV3IHRoaXMgb3V0IGFzCmEgcHJvcG9zYWwuIEkgYWdy
ZWUgdGhhdCBoYXZpbmcgdHdvIG5hbWVzIGNhbiBiZSBjb25mdXNpbmcsIGJ1dCBpbgp0aGlzIGNh
c2UgaXQgZGlkbid0IGZlZWwgdG9vIHRlcnJpYmxlIHRvIG1lLgoKSSdkIGxvdmUgdG8gaGVhciBQ
ZXRyJ3Mgb3BpbmlvbiBvbiB0aGlzIG5hbWUgY2hhbmdlLiBJJ20gaGFwcHkgd2l0aDoKCmEpIFRo
aXMgcGF0Y2ggYXMgaXQgaXMuCgpiKSBEcm9wcGluZyB0aGlzIHBhdGNoIChvciBwZXJoYXBzIGp1
c3QgY2hhbmdpbmcgaXQgdG8gYWRkIGNvbW1lbnRzKS4KCmMpIENoYW5naW5nIHRoaXMgcGF0Y2gg
dG8gcmVuYW1lIGFsbCA3MCB1c2VzIG9mIHRoZSBvbGQgbmFtZS4gQXNzdW1pbmcKdGhpcyB3aWxs
IGdvIHRocm91Z2ggQW5kcmV3IE1vcnRvbidzIHRyZWUsIEknZCBiZSBpbnRlcmVzdGVkIGluCndo
ZXRoZXIgaGUncyBPSyB3LyB0aGlzLgoKZCkgRHJvcHBpbmcgdGhpcyBwYXRjaCBmcm9tIHRoaXMg
c2VyaWVzIGJ1dCBwdXR0aW5nIGl0IG9uIHRoZQpiYWNrYnVybmVyIHRvIHRyeSB0byBkbyBsYXRl
ciAoc28gdGhhdCB0aGUgcmVuYW1lIGNhbiBoYXBwZW4gYXQgYSB0aW1lCndoZW4gaXQncyBsZWFz
dCBkaXNydXB0aXZlKS4KCgo+ID4gSWRlYWxseSB0aGlzIGNoYW5nZSB3b3VsZCBhbHNvIHJlbmFt
ZSB0aGUgYXJjaF90b3VjaF9ubWlfd2F0Y2hkb2coKSwKPiA+IGJ1dCB0aGF0IGlzIGhhcmRlciBz
aW5jZSBhcmNoX3RvdWNoX25taV93YXRjaGRvZygpIGlzIGV4cG9ydGVkIHdpdGgKPiA+IEVYUE9S
VF9TWU1CT0woKSBhbmQgdGh1cyBpcyBBQkkuIEFkZCBhIGNvbW1lbnQgbmV4dCB0byB0aGUgY2Fs
bCB0bwo+ID4gaG9wZWZ1bGx5IGFsbGV2aWF0ZSBzb21lIG9mIHRoZSBjb25mdXNpb24gaGVyZS4K
Pgo+IFdlIGRvbid0IGtlZXAgQUJJIGZpeGVkIHVwc3RyZWFtLgoKSSdtIGhhcHB5IHRvIGJlIGNv
cnJlY3RlZCwgYnV0IG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQga2VybmVsIGRldnMKbWFkZSBh
biBlZmZvcnQgbm90IHRvIG1lc3Mgd2l0aCB0aGluZ3MgZXhwb3J0ZWQgdmlhICJFWFBPUlRfU1lN
Qk9MIiwKYnV0IHRoaW5ncyBleHBvcnRlZCB2aWEgIkVYUE9SVF9TWU1CT0xfR1BMIiB3ZXJlIGZh
aXIgZ2FtZS4KCkkgZ3Vlc3MgbWF5YmUgbXkgcGF0Y2ggY2FsbGluZyBpdCAiQUJJIiBpcyBhIHN0
cm9uZ2VyIHN0YXRlbWVudCB0aGFuCnRoYXQsIHRob3VnaC4gRG9pbmcgYSBsaXR0bGUgbW9yZSBy
ZXNlYXJjaCwgbm9ib2R5IHdhbnRzIHRvIHNheSB0aGF0CnRoaW5ncyBleHBvcnRlZCB3aXRoICJF
WFBPUlRfU1lNQk9MIiBhcmUgQUJJLCB0aGV5IGp1c3Qgd2FudCB0byBzYXkKdGhhdCB3ZSBtYWtl
IGFuIGVmZm9ydCB0byBoYXZlIHRoZW0gYmUgbW9yZSBzdGFibGUuCgpTbyBjZXJ0YWlubHkgSSBz
aG91bGQgYWRqdXN0IG15IHBhdGNoIHNlcmllcyBub3QgdG8gY2FsbCBpdCBBQkksIGJ1dApJJ20g
c3RpbGwgb24gdGhlIGZlbmNlIGFib3V0IHdoZXRoZXIgSSBzaG91bGQgcmVuYW1lIHRoaXMgb3Ig
bm90LiBJJ2QKbG92ZSB0byBoZWFyIG90aGVyIG9waW5pb25zLiBUaGlzIHJlbmFtZSBhY3R1YWxs
eSB3b3VsZCBiZSBhIGxvdAplYXNpZXIgdGhhbiB0aGUgdG91Y2hfbm1pX3dhdGNoZG9nKCkgb25l
IHNpbmNlIHRoZSBjb2RlIHJlZmVyZW5jaW5nCnRoZSBuYW1lICJhcmNoX3RvdWNoX25taV93YXRj
aGRvZyIgaXNuJ3Qgc3ByZWFkIHNvIGJyb2FkbHkgdGhyb3VnaCB0aGUKa2VybmVsLgoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvWkZFcm1zaGNyY2lrclNVMUBhbGxleQoKLURvdWcKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpLZ2RiLWJ1Z3Jl
cG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2tnZGItYnVncmVwb3J0
Cg==
