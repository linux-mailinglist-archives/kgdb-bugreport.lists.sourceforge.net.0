Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC36F86E8
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 May 2023 18:38:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1puySN-00012G-Ma
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 05 May 2023 16:38:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1puySL-00012A-Sh
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=; b=KxofTsIf7emQ18B1F9fGMuLUx4
 OS+YboIDCpw0hWk9hvjUyuw8L4fafvzfXkk7LrcX8UZGx0qTWRDxDM/YkEbJHiu1Rqz2izftahT7r
 lLywwiEIOGYCpwakY29X4+IfS+3IzukaQW+vwKIDszu9jdDMwrkZ/jcvq8uHcuO3/d8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=; b=dejCprCmwH3l/QbMa62r8eNol0
 Zwnd/ZKmrrsj2NfgfMRcZTm+5S1oCd/LgMlSpcRy6Fbu97KK1TMHcYvTd4GjLbaPWmTrPw+esKsh/
 VB0Fjpwv9T94Zjf8hZTEvYtJt4qslbgl813XqYTEhMlI0rqNtl/DQOBK2bTm+sPXz4po=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puySI-0007Tr-7U for kgdb-bugreport@lists.sourceforge.net;
 Fri, 05 May 2023 16:38:53 +0000
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-74cebbb7bc5so177126485a.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683304723; x=1685896723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=;
 b=N57ER8Ic/+qCqqu5FA+fVC/ZGctw57mPbXgRnixf1yQX6nxwLVorfomAUx8A3DKiIR
 7E22p1gS+UhQ3GbmPpsjNAX4OBx4sGx/cjRL0eK15cy9y3aPZ6OuilpHfMliUVPjL9u1
 Asl1wbLHX/ZxbryLIJHT55Jj2OQpGpPMM0N9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304723; x=1685896723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFdQlmBZsVXpMFRWa31Nf9CH5lKcpqbN0ffO9NCLDqk=;
 b=kPXtqIqSRzLKu0kxndpYScKxaD4F462MjbC5gliv8/RWZlD+kjPpdX3i6Y8QYzqVeI
 7x4SIknPBoqFWy7vVV8vNu7A6l2n/yGemnPgfjRuiUcFFFIAZcxh6ap2T0uNazGVKIrO
 CBTlu9jmeSJJ+nxNy+xqv0E184/H3kb1sPP7CuuoJcxoE8/K4BTJXZQE4vIeYT422dKu
 IrtJi9vFyVzcEhX+iwbPiVO2OyZcr2VMFDkU4AP7BBWialBC0FPq+/e9cPFOSyqFMQlK
 8571Z63Vjy+XzdQrYiVqzwpUQGpOMs3aftAYjFWEf5z7LBNUOeBQKeOqG8PfVpyhPvEf
 UA7g==
X-Gm-Message-State: AC+VfDw3ZOuL+KYtO07kxxksKS3vrUtiDUkYlDlmQJkaBJaQg5s6dSpo
 R81OhVWLDtYd5SyTk1dhSajQbpakqGFx2ZEycrI=
X-Google-Smtp-Source: ACHHUZ5OBDLpOnyXgGm8MSvOQtlL5bWqBL/arVIapzTjVyeI1oRvNIgzs7rZWRxQwhI61Piq/CMQhA==
X-Received: by 2002:a05:6214:1942:b0:5a2:63a1:ecb2 with SMTP id
 q2-20020a056214194200b005a263a1ecb2mr4018369qvk.43.1683304722971; 
 Fri, 05 May 2023 09:38:42 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05620a134600b0074cf009f443sm686082qkl.85.2023.05.05.09.38.41
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 09:38:42 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3ef36d814a5so1117751cf.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 May 2023 09:38:41 -0700 (PDT)
X-Received: by 2002:ac8:5a8e:0:b0:3ef:3361:75d5 with SMTP id
 c14-20020ac85a8e000000b003ef336175d5mr266034qtc.11.1683304721570; Fri, 05 May
 2023 09:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
 <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
In-Reply-To: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 May 2023 09:38:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVhPpTLPv1fmavGz-iwW1xA2P7_Uu_=GKZ-Ofu=vReZw@mail.gmail.com>
Message-ID: <CAD=FV=VVhPpTLPv1fmavGz-iwW1xA2P7_Uu_=GKZ-Ofu=vReZw@mail.gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, May 4, 2023 at 8:07 PM Nicholas Piggin <npiggin@gmail.com>
    wrote: > > On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote: >
   > Do a search and replace of: > > - NMI_WATCHDOG_ENABLED = [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puySI-0007Tr-7U
Subject: Re: [Kgdb-bugreport] [PATCH v4 11/17] watchdog/hardlockup: Rename
 some "NMI watchdog" constants/function
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

SGksCgpPbiBUaHUsIE1heSA0LCAyMDIzIGF0IDg6MDfigK9QTSBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSBNYXkgNSwgMjAyMyBhdCA4OjEzIEFN
IEFFU1QsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBEbyBhIHNlYXJjaCBhbmQgcmVwbGFj
ZSBvZjoKPiA+IC0gTk1JX1dBVENIRE9HX0VOQUJMRUQgPT4gSEFSRF9XQVRDSERPR19FTkFCTEVE
Cj4gPiAtIHdhdGNoZG9nX25taV8gPT4gd2F0Y2hkb2dfaGFyZGxvY2t1cF8KPgo+IFRoZXNlIGFy
ZSBqdXN0IG1ha2luZyBwcmVmaXhlcyBpbmNvbnNpc3RlbnQgYWdhaW4uCj4KPiBJZiB5b3UgcmVh
bGx5IHdhbnQgdG8gZG8gYSBwcmVmaXgsIEkgd291bGQgY2FsbCBpdCBoYXJkbG9ja3VwIHdoaWNo
Cj4gcHJvYmFibHkgYmVzdCBtYXRjaGVzIGV4aXN0aW5nIGNvZGUgYW5kIHN5c2N0bCAvIGJvb3Qg
c3R1ZmYsIGFuZAo+IGNvbmNlbnRyYXRlIG9uIG5vbi1zdGF0aWMgc3ltYm9scy4KCkFzIHdpdGgg
b3RoZXIgc2ltaWxhciBwYXRjaGVzLCBJJ20gaGFwcHkgdG8gZHJvcCB0aGlzIGFuZCBhbSBkb2lu
ZyBpdAphdCBQZXRyJ3MgcmVxdWVzdC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL1pG
RXJtc2hjcmNpa3JTVTFAYWxsZXkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2tnZGItYnVncmVwb3J0Cg==
