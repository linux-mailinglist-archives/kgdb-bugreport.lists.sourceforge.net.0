Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB13727D98
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  8 Jun 2023 13:03:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q7DQY-0006xX-96
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 08 Jun 2023 11:03:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q7DQV-0006xQ-To
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmGpYQHxrkRWd3zHWeEZ/+FUz6+Ti2y9azLyKi/9VXc=; b=kYwEP/SKGyb6f0SP5uKiBujP9q
 3fWbXckcyTZgqq5X5PWwLVX7XAA0udDYkFI8CT1emrSIhi7x5nLp1NzCxJrRuU2VU6wJgl3EvJzl+
 n02SNhJCsKgSGfteAps0UMa+B6JfOCA90misA6w/GUkxP8v+UT7PHUDrmkZ7DH89a+jw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OmGpYQHxrkRWd3zHWeEZ/+FUz6+Ti2y9azLyKi/9VXc=; b=WMmZFrd6RbI086+fJJg7T9K4xC
 XSCXju9UvkRDvIOiwBaRv9Z+DO85MVArZy0frmJyWAfgvyedkYgpH8RTPmw1YGCBhMuQiRHArghku
 ew5YA6CZuQawrz/RK7yI4XcRKTq++Y+nrYmMBqk06eGTAL3nJNoW0y1/FT4v1fmpdAtE=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q7DQV-00Edux-OE for kgdb-bugreport@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:36 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 73AB81FDCB;
 Thu,  8 Jun 2023 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686222207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmGpYQHxrkRWd3zHWeEZ/+FUz6+Ti2y9azLyKi/9VXc=;
 b=c8tiLtHYMhWgJjrI950UtHFjJJ3An1MKHJgcx/Znq//lHtsgq5ldmCgdtfNVK7TuGeiKDE
 ZPtlKVMYawfGmguYaePV/4HFgd8zPjzk8L2wLXnrA3+eBLevEgpqSJuDEj8icgI59yO1GW
 rBoEh9e3GyFy8YgCMK3YOO9SBOeyoAE=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 38B7D2C141;
 Thu,  8 Jun 2023 11:03:27 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:03:26 +0200
To: Doug Anderson <dianders@chromium.org>
Message-ID: <ZIG1fpHf5ULK0zqU@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-4-pmladek@suse.com>
 <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed 2023-06-07 16:35:19, Doug Anderson wrote: > Hi, > >
    On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote: >
   > > > arch_touch_nmi_watchdog() needs a different implementation for [...]
    
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1q7DQV-00Edux-OE
Subject: Re: [Kgdb-bugreport] [PATCH 3/7] watchdog/hardlockup: Declare
 arch_touch_nmi_watchdog() only in linux/nmi.h
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

T24gV2VkIDIwMjMtMDYtMDcgMTY6MzU6MTksIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gSGksCj4g
Cj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCA4OjI14oCvQU0gUGV0ciBNbGFkZWsgPHBtbGFkZWtA
c3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IGFyY2hfdG91Y2hfbm1pX3dhdGNoZG9nKCkgbmVlZHMg
YSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24gZm9yIHZhcmlvdXMKPiA+IGhhcmRsb2NrdXAgZGV0
ZWN0b3IgaW1wbGVtZW50YXRpb25zLiBBbmQgaXQgZG9lcyBub3RoaW5nIHdoZW4KPiA+IGFueSBo
YXJkbG9ja3VwIGRldGVjdG9yIGlzIG5vdCBidWlsZCBhdCBhbGwuCj4gCj4gcy9idWlsZC9idWls
dC8KCldpbGwgZml4IGluIHYyLgoKPiAKPiBUaGlzIGxvb2tzIHJpZ2h0IGFuZCBpcyBhIG5pY2Ug
Y2xlYW51cC4KPiAKPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgoKVGhhbmtzIGEgbG90LgoKQmVzdCBSZWdhcmRzLApQZXRyCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdyZXBvcnQgbWFp
bGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9ydAo=
