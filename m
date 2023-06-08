Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9717281AF
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 15:48:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7Fzv-0007nx-2a
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 13:48:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q7Fzp-0007nb-N4
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yP9xLPyYFMGMpi467QcNnB+YH/wlZqcYZh3EWd4dmcY=; b=gYQdPEH1S9jmOoVOThKSlJA6we
 GTnMM/BOYkYNRlmd0KTB0SnHyM94Ce6p+2fgksyTWE4xn3fzs/Ilfb9fJWP9mH4/1AwVhp1HWeDys
 ATRAqqMF86Tr4e1uSYVI3RQDt70KwnYA7fOM2JaVZhWEc/1PWU1wWxVbJUaoFLkgJn3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yP9xLPyYFMGMpi467QcNnB+YH/wlZqcYZh3EWd4dmcY=; b=cJtzff5EbpIeKwU1zUJMlO6BjU
 qpMfYB4/BD8EKUNkAyutC+2MJpgWxOGFKFNeMOYjuViudh2GVKfcYvFfqUmSGkzt8xR7vvM+EZxl+
 dX7W2gkVrVEryvF5ThjjS87IBJM6L4OF7Bp3960ust7VP+CzGDUdJpmd1uyoXud6swrY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7Fzn-00Ekm8-Oo for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 13:48:13 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7FFAF219A2;
 Thu,  8 Jun 2023 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686232085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP9xLPyYFMGMpi467QcNnB+YH/wlZqcYZh3EWd4dmcY=;
 b=m63+KFvTBQEoswSYPzhIsHPn1FjqqayGRiQzC/FIKdmwxak8gkx7w9F9rldbURg/etSpZc
 BICnIf8C0z7eVZcnDvN4FdSPCN3o9oRJ9oMQtLZEJ/cLQcCi3cF2Tr8r9iBwWpkH8zBjE5
 J6OpJnSRXarKOZcGInmiJWE83pipteA=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 45B052C142;
 Thu,  8 Jun 2023 13:48:05 +0000 (UTC)
Date: Thu, 8 Jun 2023 15:48:04 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIHcFDnQPuVe1vAc@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-8-pmladek@suse.com>
 <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-06-07 16:37:10, Doug Anderson wrote: > Hi, > >
    On Wed, Jun 7, 2023 at 8:26 AM Petr Mladek <pmladek@suse.com> wrote: >
   > > > @@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY > > de [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q7Fzn-00Ekm8-Oo
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
From: Petr Mladek via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Petr Mladek <pmladek@suse.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gV2VkIDIwMjMtMDYtMDcgMTY6Mzc6MTAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjI24oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IEBAIC0xMTAyLDYgKzExMDMsMTQgQEAgY29uZmlnIEhB
UkRMT0NLVVBfREVURUNUT1JfQlVERFkKPiA+ICAgICAgICAgZGVwZW5kcyBvbiAhSEFWRV9IQVJE
TE9DS1VQX0RFVEVDVE9SX0FSQ0gKPiA+ICAgICAgICAgc2VsZWN0IEhBUkRMT0NLVVBfREVURUNU
T1JfQ09VTlRTX0hSVElNRVIKPiA+Cj4gPiArY29uZmlnIEhBUkRMT0NLVVBfREVURUNUT1JfQVJD
SAo+ID4gKyAgICAgICBib29sCj4gPiArICAgICAgIGRlcGVuZHMgb24gSEFSRExPQ0tVUF9ERVRF
Q1RPUgo+ID4gKyAgICAgICBkZXBlbmRzIG9uIEhBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9BUkNI
Cj4gPiArICAgICAgIGhlbHAKPiA+ICsgICAgICAgICBUaGUgYXJjaC1zcGVjaWZpYyBpbXBsZW1l
bnRhdGlvbiBvZiB0aGUgaGFyZGxvY2t1cCBkZXRlY3RvciBpcwo+ID4gKyAgICAgICAgIGF2YWls
YWJsZS4KPiAKPiBuaXQ6ICJpcyBhdmFpbGFibGUiIG1ha2VzIGl0IHNvdW5kIGEgYml0IHRvbyBt
dWNoIGxpa2UgYSAiaGF2ZSIKPiB2ZXJzaW9uLiBNYXliZSAiVGhlIGFyY2gtc3BlY2lmaWMgaW1w
bGVtZW50YXRpb24gb2YgdGhlIGhhcmRsb2NrdXAKPiBkZXRlY3RvciB3aWxsIGJlIHVzZWQiIG9y
IHNvbWV0aGluZyBsaWtlIHRoYXQ/CgpNYWtlcyBzZW5zZS4gV2lsbCBkbyB0aGlzIGNoYW5nZSBp
biB2Mi4KCj4gT3RoZXJpc2U6Cj4gCj4gUmV2aWV3ZWQtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRp
YW5kZXJzQGNocm9taXVtLm9yZz4KClRoYW5rcywKUGV0cgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApL
Z2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
