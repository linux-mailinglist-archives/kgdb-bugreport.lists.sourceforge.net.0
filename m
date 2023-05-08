Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D10D6FC7B0
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  9 May 2023 15:15:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pwNBr-0007c7-Tv
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 09 May 2023 13:15:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <npiggin@gmail.com>) id 1pvpJF-0001Ax-Ix
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 01:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:References:Subject:Cc:To:From:
 Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=; b=CHaQTAEMZGqyObRgPetYfbhxF/
 0LZUn6dbJuFW/LqYEw9oVZNd3UhkS/4o0b43ANPquhT9n+nutYqlCIVGjkZALfDtOSlnINam0QvAG
 xi40wyy4v7St8/Z9VQ0GagcAA6k6qQjnWhevLGgVmgmdWeofjS2Pz3lhjU5kgY09fzR0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Content-Type:
 Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=; b=F+qCCP7olqp0ye59KeQeYBq5xw
 knKdoOVC+QaIqF2XCZw7gskHeLj4L532aG5aSHd2oXmFNqG5zqpY1hNzVmLzcdCcLjkwW2sMBrbJJ
 WwR4rksHalXBu6D6wGR3UjGhs2QV8p1OSbUcmxo7LwCJIg/le1Q0mnMnkg1SMxl7JDxI=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pvpJE-001NGF-UJ for kgdb-bugreport@lists.sourceforge.net;
 Mon, 08 May 2023 01:05:01 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-24df6bbf765so3563886a91.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 07 May 2023 18:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683507895; x=1686099895;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=;
 b=g6nKyzCdl7wTzFzj0LPDCvxv55Fy7TfpGWgO3pV6ij+uOoq81YB2jNTSX5iaFONC1a
 2mmifmqG7gTqnR60RJOMRKTGxfC1MPZOBDnxBxC8EfLhTHJL8AhE1/n2yUOJyPMLC9o/
 uuml0GrB72oOnQcqwCMNQfB2MRnFdMZQT3rB+TP3y0CeS4NjZ5eUYbvjHqlpvDWij0mY
 +Rsmlbec0zcoH6AhBTwgJ1Kv0dXBCznV96/reb0frVyB8K6Y485zWs34lthhXNKMQ7fk
 dmwcTIP128fzDg1lcXBtIwm0yEzMGvicYdNfyIwQCmGboUqYj0oPhBVNRspiaZjXGsoc
 yQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683507895; x=1686099895;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L+PPFKXX425r8vzKPVM6Zic55f59QA5mguBoW8dBKWo=;
 b=LSyaIMJk40GSgD6r3a3aTiBEmFIyYLO2l6lTLAM8ZYKSK22UqcyAVkfKPfvRPeeYAD
 u9P8WM+Fn3F/BfLYQxDXp60aacJoqK7Ud3Je1xWieWCfQQqJmQVhRMp9J0SWK4Hr8ypY
 uoQP9CutIjzymVaDLPf3Yd3jK6etNNhMtVLf9kpdyu5zi1QA+gc59e/MHJQAF0RGdq+F
 l5/j4QJG6mwDif/CJktTmMrK+oH26VhZbzWtWwZmPRj8MePvk6H1RRi+ZSwwu4Xazpfd
 2WcwNAgUXaSP0t3meBGvYA5xf3N8Gt/4J8as6BhpiKO6I+JCDW8GLHyLCZsxg5AYfGVy
 a8+A==
X-Gm-Message-State: AC+VfDzQec+QBHM10fIYQzSke6cmpLMi61iittu6hG7kbPBHouMtoCXF
 P+H1IVVWn4ihDSoLCJYEIrA=
X-Google-Smtp-Source: ACHHUZ59icTjTc2OdzI15EfiZxFSZ69uNN4QwbtfViigDNmld+b2odQxDB6B0BmyEFVXN9x050Oztw==
X-Received: by 2002:a17:90b:3142:b0:246:f8d7:3083 with SMTP id
 ip2-20020a17090b314200b00246f8d73083mr8577679pjb.16.1683507895288; 
 Sun, 07 May 2023 18:04:55 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
 by smtp.gmail.com with ESMTPSA id
 ie14-20020a17090b400e00b0024e1172c1d3sm11713201pjb.32.2023.05.07.18.04.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 18:04:54 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 08 May 2023 11:04:40 +1000
Message-Id: <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
 <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
In-Reply-To: <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sat May 6, 2023 at 2:35 AM AEST, Doug Anderson wrote: >
    Hi, > > On Thu, May 4, 2023 at 7:36 PM Nicholas Piggin wrote: > > > > On
    Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: > > > F [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [npiggin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.216.41 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvpJE-001NGF-UJ
X-Mailman-Approved-At: Tue, 09 May 2023 13:15:35 +0000
Subject: Re: [Kgdb-bugreport] [PATCH v4 13/17] watchdog/hardlockup: detect
 hard lockups using secondary (buddy) CPUs
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
 Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan
 Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org,
 ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gU2F0IE1heSA2LCAyMDIzIGF0IDI6MzUgQU0gQUVTVCwgRG91ZyBBbmRlcnNvbiB3cm90ZToK
PiBIaSwKPgo+IE9uIFRodSwgTWF5IDQsIDIwMjMgYXQgNzozNuKAr1BNIE5pY2hvbGFzIFBpZ2dp
biA8bnBpZ2dpbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSBNYXkgNSwgMjAyMyBh
dCA4OjEzIEFNIEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiA+IEZyb206IENvbGlu
IENyb3NzIDxjY3Jvc3NAYW5kcm9pZC5jb20+Cj4gPiA+Cj4gPiA+IEltcGxlbWVudCBhIGhhcmRs
b2NrdXAgZGV0ZWN0b3IgdGhhdCBkb2Vzbid0IGRvZXNuJ3QgbmVlZCBhbnkgZXh0cmEKPiA+ID4g
YXJjaC1zcGVjaWZpYyBzdXBwb3J0IGNvZGUgdG8gZGV0ZWN0IGxvY2t1cHMuIEluc3RlYWQgb2Yg
dXNpbmcKPiA+ID4gc29tZXRoaW5nIGFyY2gtc3BlY2lmaWMgd2Ugd2lsbCB1c2UgdGhlIGJ1ZGR5
IHN5c3RlbSwgd2hlcmUgZWFjaCBDUFUKPiA+ID4gd2F0Y2hlcyBvdXQgZm9yIGFub3RoZXIgb25l
LiBTcGVjaWZpY2FsbHksIGVhY2ggQ1BVIHdpbGwgdXNlIGl0cwo+ID4gPiBzb2Z0bG9ja3VwIGhy
dGltZXIgdG8gY2hlY2sgdGhhdCB0aGUgbmV4dCBDUFUgaXMgcHJvY2Vzc2luZyBocnRpbWVyCj4g
PiA+IGludGVycnVwdHMgYnkgdmVyaWZ5aW5nIHRoYXQgYSBjb3VudGVyIGlzIGluY3JlYXNpbmcu
Cj4gPgo+ID4gUG93ZXJwYydzIHdhdGNoZG9nIGhhcyBhbiBTTVAgY2hlY2tlciwgZGlkIHlvdSBz
ZWUgaXQ/Cj4KPiBObywgSSB3YXNuJ3QgYXdhcmUgb2YgaXQuIEludGVyZXN0aW5nLCBpdCBzZWVt
cyB0byBiYXNpY2FsbHkgZW5hYmxlCj4gYm90aCB0eXBlcyBvZiBoYXJkbG9ja3VwIGRldGVjdG9y
cyB0b2dldGhlci4gSWYgdGhhdCByZWFsbHkgY2F0Y2hlcwo+IG1vcmUgbG9ja3VwcywgaXQgc2Vl
bXMgbGlrZSB3ZSBjb3VsZCBkbyB0aGUgc2FtZSB0aGluZyBmb3IgdGhlIGJ1ZGR5Cj4gc3lzdGVt
LgoKSXQgZG9lc24ndCBjYXRjaCBtb3JlIGxvY2t1cHMuIE9uIHBvd2VycGMgd2UgZG9uJ3QgaGF2
ZSBhIHJlbGlhYmxlCnBlcmlvZGljIE5NSSBoZW5jZSB0aGUgU01QIGNoZWNrZXIuIEJ1dCBpdCBp
cyBwcmVmZXJhYmxlIHRoYXQgYSBDUFUKZGV0ZWN0cyBpdHMgb3duIGxvY2t1cCBiZWNhdXNlIE5N
SSBJUElzIGNhbiByZXN1bHQgaW4gY3Jhc2hlcyBpZgp0aGV5IGFyZSB0YWtlbiBpbiBjZXJ0YWlu
IGNyaXRpY2FsIHNlY3Rpb25zLgoKPiBJZiBwZW9wbGUgd2FudCwgSSBkb24ndCB0aGluayBpdCB3
b3VsZCBiZSB2ZXJ5IGhhcmQgdG8gbWFrZQo+IHRoZSBidWRkeSBzeXN0ZW0gX25vdF8gZXhjbHVz
aXZlIG9mIHRoZSBwZXJmIHN5c3RlbS4gSW5zdGVhZCBvZiBoYXZpbmcKPiB0aGUgYnVkZHkgc3lz
dGVtIGltcGxlbWVudCB0aGUgIndlYWsiIGZ1bmN0aW9ucyBJIGNvdWxkIGp1c3QgY2FsbCB0aGUK
PiBidWRkeSBmdW5jdGlvbnMgaW4gdGhlIHJpZ2h0IHBsYWNlcyBkaXJlY3RseSBhbmQgbGVhdmUg
dGhlICJ3ZWFrIgo+IGZ1bmN0aW9ucyBmb3IgYSBtb3JlIHRyYWRpdGlvbmFsIGhhcmRsb2NrdXAg
ZGV0ZWN0b3IgdG8gaW1wbGVtZW50Lgo+IE9waW5pb25zPwo+Cj4gTWF5YmUgYWZ0ZXIgYWxsIHRo
aXMgbGFuZHMsIHRoZSBwb3dlcnBjIHdhdGNoZG9nIGNvdWxkIG1vdmUgdG8gdXNlIHRoZQo+IGNv
bW1vbiBjb2RlPyBBcyBldmlkZW5jZWQgYnkgdGhpcyBwYXRjaCBzZXJpZXMsIHRoZXJlJ3Mgbm90
IHJlYWxseSBhCj4gcmVhc29uIGZvciB0aGUgU01QIGRldGVjdGlvbiB0byBiZSBwbGF0Zm9ybSBz
cGVjaWZpYy4KClRoZSBwb3dlcnBjIFNNUCBjaGVja2VyIGNvdWxkIGNlcnRhaW5seSBtb3ZlIHRv
IGNvbW1vbiBjb2RlIGlmCm90aGVycyB3YW50ZWQgdG8gdXNlIGl0LgoKPiA+IEl0J3MgYWxsIHRv
Cj4gPiBhbGwgcmF0aGVyIHRoYW4gYnVkZHkgd2hpY2ggbWFrZXMgaXQgbW9yZSBjb21wbGljYXRl
ZCBidXQgYXJndWFibHkKPiA+IGJpdCBiZXR0ZXIgZnVuY3Rpb25hbGl0eS4KPgo+IENhbiB5b3Ug
Y29tZSB1cCB3aXRoIGFuIGV4YW1wbGUgY3Jhc2ggd2hlcmUgdGhlICJhbGwgdG8gYWxsIiB3b3Vs
ZAo+IHdvcmsgYmV0dGVyIHRoYW4gdGhlIHNpbXBsZSBidWRkeSBzeXN0ZW0gcHJvdmlkZWQgYnkg
dGhpcyBwYXRjaD8KCkNQVTIgICAgICAgICAgICAgICAgICAgICBDUFUzCnNwaW5fbG9ja19pcnFz
YXZlKEEpICAgICBzcGluX2xvY2tfaXJxc2F2ZShCKQpzcGluX2xvY2tfaXJxc2F2ZShCKSAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoQSkKCkNQVTEgd2lsbCBkZXRlY3QgdGhlIGxvY2t1cCBvbiBDUFUy
LCBidXQgQ1BVMydzIGxvY2t1cCB3b24ndCBiZQpkZXRlY3RlZCBzbyB3ZSBkb24ndCBnZXQgdGhl
IHRyYWNlIHRoYXQgY2FuIGRpYWdub3NlIHRoZSBidWcuCgpBbm90aGVyIHRoaW5nIEkgYWN0dWFs
bHkgZm91bmQgaXQgdXNlZnVsIGZvciBpcyB5b3UgY2FuIGVhc2lseQpzZWUgaWYgYSBjb3JlIChp
LmUuLCBhbGwgdGhyZWFkcyBpbiB0aGUgY29yZSkgb3IgYSBjaGlwIGhhcwpkaWVkLiBNYXliZSBt
b3JlIHVzZWZ1bCB3aGVuIGRvaW5nIHByZXNpbGljb24gYW5kIGJyaW5nIHVwIHdvcmsKb3IgZmly
bXdhcmUgaGFja2luZywgYnV0IHN0aWxsIHVzZWZ1bC4KClRoYW5rcywKTmljawoKPiBJdAo+IHNl
ZW1zIGxpa2UgdGhleSB3b3VsZCBiZSBlcXVpdmFsZW50LCBidXQgSSBjb3VsZCBiZSBtaXNzaW5n
IHNvbWV0aGluZy4KPiBTcGVjaWZpY2FsbHkgdGhleSBib3RoIG5lZWQgYXQgbGVhc3Qgb25lIG5v
bi1sb2NrZWQtdXAgQ1BVIHRvIGRldGVjdCBhCj4gcHJvYmxlbS4gSWYgb25lIG9yIG1vcmUgQ1BV
cyBpcyBsb2NrZWQgdXAgdGhlbiB3ZSdsbCBhbHdheXMgZGV0ZWN0IGl0Lgo+IEkgc3VwcG9zZSBt
YXliZSB5b3UgY291bGQgcHJvdmlkZSBhIGJldHRlciBlcnJvciBtZXNzYWdlIGF0IGxvY2t1cAo+
IHRpbWUgc2F5aW5nIHRoYXQgc2V2ZXJhbCBDUFVzIHdlcmUgbG9ja2VkIHVwIGFuZCB0aGF0IGNv
dWxkIGJlCj4gaGVscGZ1bC4gRm9yIG5vdywgSSdkIGtlZXAgdGhlIGN1cnJlbnQgYnVkZHkgc3lz
dGVtIHRoZSB3YXkgaXQgaXMgYW5kCj4gaWYgeW91IHdhbnQgdG8gcHJvdmlkZSBhIHBhdGNoIGlt
cHJvdmluZyB0aGluZ3MgdG8gYmUgImFsbC10by1hbGwiIGluCj4gdGhlIGZ1dHVyZSB0aGF0IHdv
dWxkIGJlIGludGVyZXN0aW5nIHRvIHJldmlldy4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
