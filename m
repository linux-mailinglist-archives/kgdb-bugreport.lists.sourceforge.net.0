Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB47300D6
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Jun 2023 15:54:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q9Qwi-0008O9-LT
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 14 Jun 2023 13:54:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q9Qwh-0008Nn-NI
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jun 2023 13:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=; b=cjb2p46PEwYJNwu0c9Q7CmY+BL
 zu1kvnjtXLvQtgiS9oMZ+CQuP2lc9ImhHotUz3EYnYgh8upf8SRbrmRYt1VQwFdC08N4EjJnJAduB
 VqwS+8V2Gw+Jd5+KED6aAFDrM0dDnbnNxFSg3h4/2kj3LIWX6C+VI6qTAzxfSR5qhpM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=; b=Q1Zn51Sgio6jYOgG/U3u5RsDsk
 UexPj4NXZ6/hziEBFzxfDuq/y6BUh+oe8glfTSBrHxQK7n6VW5/CPAf8czJgZtN+9VqTAKSyN69Nh
 WgzjSQIMcPW7wH1Wd3kNoomT28qssWe2WWKSw4ZVDSe52AjPeeN4uIRav4PiLp1uxD5s=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q9Qwg-000742-6O for kgdb-bugreport@lists.sourceforge.net;
 Wed, 14 Jun 2023 13:53:59 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-519c0ad1223so556819a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jun 2023 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686750831; x=1689342831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=;
 b=gMoFJ36ot73S6Dw8zIApUmpgXzl/zQXHNCvEByika7hjFZg85vsiEpx/k8LCVQUy3A
 S2jHLpqP+hKfWPTiLkSSaAe99+wrKSWP/xNx5u0tTDbldGTjLT1BqAK+Qzd8KwscGkKn
 5Zm3VC/tEnvHruP4jitQj/X1TfGXqEyn03b+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686750831; x=1689342831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=76di/i2mInmVCxeVKqtSRBrcXSBLthtuA5QqmKpv0gg=;
 b=ED3Y80SWIHzYPqrmEmwXHxNXlky4aXFzhChCZo0ABrsGybwLcTwAWZoj5cOSHZSxK+
 JnM5bMlvMEv2dYhRNhQmBDUPGKZ0DCwfS59Zi4BHsRJzqbyma52wGYjCafhA6khHSU6z
 uavzAlsLeQMZFdyD7naD7wK2I9toRsHKBEWt2k1Cn/D2hvPQWiaIIQaIoirFOlMR7ZWI
 VbUIQZ4DGxuFbaqoDrQQJUHTFOQEgp6zy6wqGruRS1Hx5e5P+AuLvH/B69ZeAPaOP0wH
 owghOXnvACYQWfHvp43ugFNfUHfpuUM5d247pPDztvdHRrpSS+0WzbvfIgz9HOcjb/IU
 7MBA==
X-Gm-Message-State: AC+VfDzi/ofdgClBz0c0QiPN5t00OLrWNWaPkVdOdYr/2M0BzxiHMYVA
 K4Wki93nCypXtHydk6eyUQvOAF64LMRYAKCnlAnuPCOZ
X-Google-Smtp-Source: ACHHUZ6ZSi5YTbA/HxEZgwtilGGu9PFBU75c4mI9+L9SdgxfBoGS8vZrQ8xe6WBX4u1XSOZLLTe7NQ==
X-Received: by 2002:a17:906:ef07:b0:96f:678:d2fc with SMTP id
 f7-20020a170906ef0700b0096f0678d2fcmr14879572ejs.22.1686750452893; 
 Wed, 14 Jun 2023 06:47:32 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 k7-20020a17090627c700b00977da9d4ef9sm8216371ejc.18.2023.06.14.06.47.31
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 06:47:32 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so8281a12.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Jun 2023 06:47:31 -0700 (PDT)
X-Received: by 2002:a50:9f82:0:b0:50b:c48c:8a25 with SMTP id
 c2-20020a509f82000000b0050bc48c8a25mr104476edf.6.1686750451172; Wed, 14 Jun
 2023 06:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com>
 <ZIG1Qi0iUjTKICQM@alley>
 <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
 <ZImWd62fXjsZildv@alley>
In-Reply-To: <ZImWd62fXjsZildv@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Jun 2023 06:47:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP39nUmdeNjjTGx-XWhS4AgG5haHCfYjFUCEKckYVZDA@mail.gmail.com>
Message-ID: <CAD=FV=WP39nUmdeNjjTGx-XWhS4AgG5haHCfYjFUCEKckYVZDA@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 14, 2023 at 3:29 AM Petr Mladek <pmladek@suse.com>
    wrote: > > It seems that we have entered into a bike shedding mode. > The
    following questions come to my mind: > > 1. Does this patchse [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9Qwg-000742-6O
Subject: Re: [Kgdb-bugreport] [PATCH 2/7] watchdog/hardlockup: Make the
 config checks more straightforward
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEp1biAxNCwgMjAyMyBhdCAzOjI54oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFk
ZWtAc3VzZS5jb20+IHdyb3RlOgo+Cj4gSXQgc2VlbXMgdGhhdCB3ZSBoYXZlIGVudGVyZWQgaW50
byBhIGJpa2Ugc2hlZGRpbmcgbW9kZS4KPiBUaGUgZm9sbG93aW5nIHF1ZXN0aW9ucyBjb21lIHRv
IG15IG1pbmQ6Cj4KPiAgICAxLiBEb2VzIHRoaXMgcGF0Y2hzZXQgaW1wcm92ZSB0aGUgY3VycmVu
dCBzdGF0ZT8KPgo+ICAgIDIuIE1heWJlLCBpdCBpcyBub3QgYmxhY2smd2hpdGUuIElzIGl0IHBv
c3NpYmxlIHRvIHN1bW1hcml6ZQo+ICAgICAgIHdoYXQgZXhhY3RseSBnb3QgYmV0dGVyIGFuZCB3
aGF0IGdvdCB3b3JzZT8KPgo+IE1heWJlLCB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIGJpa2Utc2hl
ZGRpbmcgYWJvdXQgZXZlcnkgc3RlcAo+IGlmIHRoZSBmaW5hbCByZXN1bHQgaXMgcmVhc29uYWJs
ZSBhbmQgdGhlIHN0ZXBzIGFyZSBub3QKPiBjb21wbGV0ZWx5IHdyb25nLgo+Cj4gSSBqdXN0IGZv
bGxvd2VkIG15IGludHVpdGlvbiBhbmQgdHJpZWQgdG8gZG8gc29tZSBjaGFuZ2VzIHN0ZXAKPiBi
eSBzdGVwLiBJIGdvdCBsb3N0IG1hbnkgdGltZXMgc28gbWF5YmUgdGhlIHN0ZXBzIGFyZSBub3QK
PiBpZGVhbC4gQW55d2F5LCB0aGUgc3RlcHMgaGVscGVkIG1lIHRvIHVuZGVyc3RhbmQgdGhlIGxv
Z2ljCj4gYW5kIHN0YXkgcmVhc29uYWJseSBjb25maWRlbnQgdGhhdCB0aGV5IGRpZCBub3QgY2hh
bmdlCj4gdGhlIGJlaGF2aW9yLgo+Cj4gSSBjb3VsZCByZXdvcmsgdGhlIHBhdGNoc2V0LiBCdXQg
SSBmaXJzdCBuZWVkIHRvIGtub3cgd2hhdAo+IGV4YWN0bHkgaXMgYmFkIGluIHRoZSByZXN1bHQu
IEFuZCBldmVudHVhbGx5IGlmIHRoZXJlIGlzIG1vcmUKPiBsb2dpY2FsIHdheSBob3cgdG8gZW5k
IHRoZXJlLgoKU3VyZS4gSSBzdGlsbCBmZWVsIGxpa2UgdGhlIGVuZCByZXN1bHQgb2YgdGhlIENP
TkZJRyBvcHRpb25zIGFmdGVyCnlvdXIgd2hvbGUgcGF0Y2hzZXQgaXMgZWFzaWVyIHRvIHVuZGVy
c3RhbmQgLyBjbGVhbmVyIGJ5IGFkanVzdGluZyB0aGUKZGVwZW5kZW5jaWVzIGFzIEkgaGF2ZSBz
dWdnZXN0ZWQuIFRoYXQgYmVpbmcgc2FpZCwgSSBhZ3JlZSB0aGF0IGl0IGlzCnRoZSB0eXBlIG9m
IHRoaW5nIHRoYXQgY2FuIGJlIG1vcmUgYSBtYXR0ZXIgb2YgcGVyc29uYWwgcHJlZmVyZW5jZS4g
SQpkbyBhZ3JlZSB0aGF0LCBldmVuIGlmIHlvdSBkb24ndCB0YWtlIG15IHN1Z2dlc3Rpb24gb2Yg
YWRqdXN0aW5nIHRoZQpkZXBlbmRlbmNpZXMsIHRoZSBlbmQgcmVzdWx0IG9mIHlvdXIgcGF0Y2hz
ZXQgc3RpbGwgbWFrZXMgdGhpbmdzCmJldHRlciB0aGFuIHRoZXkgd2VyZS4KCi4uLnNvIGlmIHlv
dSByZWFsbHkgZmVlbCBzdHJvbmdseSB0aGF0IHRoaW5ncyBhcmUgbW9yZSB1bmRlcnN0YW5kYWJs
ZQp3aXRoIHRoZSBkZXBlbmRlbmNpZXMgc3BlY2lmaWVkIGFzIHlvdSBoYXZlLCBJIHdvbid0IHN0
YW5kIGluIHRoZSB3YXkuCkkgc3RpbGwgdGhpbmsgeW91IG5lZWQgYSB2MiwgdGhvdWdoLCBqdXN0
IHRvIGFkZHJlc3Mgb3RoZXIgbml0cy4KCi1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGIt
YnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
