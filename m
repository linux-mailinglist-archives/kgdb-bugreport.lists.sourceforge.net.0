Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653172731E
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 01:37:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q72ik-0000AA-35
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 23:37:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q72ic-00009S-B8
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=; b=HKIRTSYEkwLp4E76vaePkGxBJL
 MqWS1YHImSYmUAxDDSN7MAZrZWypWlhGzyvgOAiGgajw+0tXrXVVCYuVLzUF1FNtKCYwCKo2Oyez4
 ChbqPtdwQFvSXMk2jklm7d4+9NB/yxA5dHNWBjm+Pf98l5WaLUezYzZhYk6p1i10ZVmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=; b=hVOL0EwKVHGAIFTHPul8ge8dtD
 a6Bb/zUCOkmKWwcqnxMvdgTX7mmiCRsoCE2XHnvKpx52eXp9tXty1eDmji4PNAjNRZdStubsqjMH6
 i0suyrzaGDp4NGwo+onTKotrHdmDTIhCADsuNLCS7/X8uN/2OsVjgMfGFLpvbNZuuMRU=;
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q72ia-0001zr-BG for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 23:37:34 +0000
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7606d460da7so255662439f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686181046; x=1688773046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=;
 b=ViTqqQZ4gxUdmTeiKkCFbSJ7EHi1LMWacDWxR7OYkEW4se2b+d0D98SWfh+A8NgJ5v
 ctXNm24kiPiDz39c3PNWL0+QMgucCd50Ga4vcJL112VaLJQsyXEMoN8XFEfKhp7OeGgU
 TlTkxRs+UDUTG8y3iTUIseWOko2k9BfsrIvMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686181046; x=1688773046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=;
 b=ZOy4AfsPBROM9EAr+npRHvCfrqkUciF7ifDx6fbZNXofLCMeksabrbfZT78UKwTfwz
 oGvqA4dr+pIhKm9KeA6jTUmqfL352tnFLweMZ24w2Ri+Nk5WUM3aiKogqlscjkphhxUD
 66kINoZvni8ra/364BLHJWWK9nN4tSelxXODxaNN7coYIqvR4FJHXUqmq/XMYk2cGq8E
 PHoRTWuBHEbmB9cQ3AXsw5b23EPLiJgPA9rtanX/Kk6WqE0Cp5qR5bd3I7holdn771Gh
 nwjHaRmVIp1wgyQovoU8ByAgublB5Htg3QcR44bvfWMQNE6qKVSonszMfxY4s1wDWHUV
 EDrw==
X-Gm-Message-State: AC+VfDzCb9H4wQrUBfmW4W0pV3gNkQ9EowiMZkZ1MBmO/ISzQvd6I2BA
 D53yrTJKMzgxLKNnXk2THKa2w65Vu1+RqmAuyhQ=
X-Google-Smtp-Source: ACHHUZ5DoIPX3lcKlN6xiPxPotZU2P0XgMxQwMSX/YIro2LG+nO3CyKZVxRRM6QRMI7R3+pCVbqeMA==
X-Received: by 2002:a6b:d911:0:b0:76d:7522:2658 with SMTP id
 r17-20020a6bd911000000b0076d75222658mr7137938ioc.9.1686181045888; 
 Wed, 07 Jun 2023 16:37:25 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 z25-20020a6b0a19000000b00760f256037dsm2305875ioi.44.2023.06.07.16.37.22
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:37:23 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so26265ab.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 07 Jun 2023 16:37:22 -0700 (PDT)
X-Received: by 2002:a92:cda5:0:b0:338:1993:1194 with SMTP id
 g5-20020a92cda5000000b0033819931194mr7952ild.2.1686181042584; Wed, 07 Jun
 2023 16:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-8-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-8-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:37:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
Message-ID: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
To: Petr Mladek <pmladek@suse.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Wed, Jun 7, 2023 at 8:26 AM Petr Mladek <pmladek@suse.com>
    wrote: > > @@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY > depends
    on !HAVE_HARDLOCKUP_DETECTOR_ARCH > select HARDLOCKUP_DETEC [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.166.44 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.166.44 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q72ia-0001zr-BG
Subject: Re: [Kgdb-bugreport] [PATCH 7/7] watchdog/hardlockup: Define
 HARDLOCKUP_DETECTOR_ARCH
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

SGksCgpPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDg6MjbigK9BTSBQZXRyIE1sYWRlayA8cG1sYWRl
a0BzdXNlLmNvbT4gd3JvdGU6Cj4KPiBAQCAtMTEwMiw2ICsxMTAzLDE0IEBAIGNvbmZpZyBIQVJE
TE9DS1VQX0RFVEVDVE9SX0JVRERZCj4gICAgICAgICBkZXBlbmRzIG9uICFIQVZFX0hBUkRMT0NL
VVBfREVURUNUT1JfQVJDSAo+ICAgICAgICAgc2VsZWN0IEhBUkRMT0NLVVBfREVURUNUT1JfQ09V
TlRTX0hSVElNRVIKPgo+ICtjb25maWcgSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNICj4gKyAgICAg
ICBib29sCj4gKyAgICAgICBkZXBlbmRzIG9uIEhBUkRMT0NLVVBfREVURUNUT1IKPiArICAgICAg
IGRlcGVuZHMgb24gSEFWRV9IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0gKPiArICAgICAgIGhlbHAK
PiArICAgICAgICAgVGhlIGFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gb2YgdGhlIGhhcmRs
b2NrdXAgZGV0ZWN0b3IgaXMKPiArICAgICAgICAgYXZhaWxhYmxlLgoKbml0OiAiaXMgYXZhaWxh
YmxlIiBtYWtlcyBpdCBzb3VuZCBhIGJpdCB0b28gbXVjaCBsaWtlIGEgImhhdmUiCnZlcnNpb24u
IE1heWJlICJUaGUgYXJjaC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgaGFyZGxvY2t1
cApkZXRlY3RvciB3aWxsIGJlIHVzZWQiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ/CgpPdGhlcmlz
ZToKClJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1i
dWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3Jl
cG9ydAo=
