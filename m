Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F472644C
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  7 Jun 2023 17:25:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q6v2A-0002Dd-Vv
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 07 Jun 2023 15:25:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1q6v29-0002DX-OX
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3dXGf7k+4oTYlBaWumJNU4jR3nmmEHJWtnu0vSLVKpY=; b=KkWb0z3dxraFYPKJHGL3zMqdRm
 IaGw3gjO/VP0tfQ4jlPj6xxMRhvCnjvExdCYze/bxIjW9parecxJBE8WrkYy9/W6g/2LoSrRmTWa9
 gm1WdPOMZiwZ/nUbfj7deUuCMKaTU6AxF+STkoxLpnhBJfMYPjf+RTwDRXZ74XrpLMeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3dXGf7k+4oTYlBaWumJNU4jR3nmmEHJWtnu0vSLVKpY=; b=B
 ruwkPKWyhB0Hp+dmT4YyehLK9wM/bem6mx8Is3A42UyIsbUPHqNpvlEeiPWAtNdVom8CxDNpdGX3k
 tF8lap7XdmsN63VoygXX0jhASEfot9zYI41rI3/O8JVLSBBj1fMFQ9iYkKFMJ5nYuJktdHZfCtqO4
 Mi56u3CQ3QM2+Yzs=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q6v23-0003Ju-Np for kgdb-bugreport@lists.sourceforge.net;
 Wed, 07 Jun 2023 15:25:14 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 764C421A0A;
 Wed,  7 Jun 2023 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686151501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3dXGf7k+4oTYlBaWumJNU4jR3nmmEHJWtnu0vSLVKpY=;
 b=B+PBZJXThYIOntzOMYJN1M7HOWKlcyfHTjqwYAzKeYBeg7N4H53o02U8FpcHbdfxQS/12F
 pD2SxjHz7edW0+GtChSdSrs+u54G5UDKluEkn024K10JO0UxcGtR6rRHIiyWQ7rmD6W5Wk
 GvOPqUkg6P2Kqu+RevoP90n3lOrnJZQ=
Received: from alley.suse.cz (unknown [10.100.201.202])
 by relay2.suse.de (Postfix) with ESMTP id 6C3A12C141;
 Wed,  7 Jun 2023 15:24:59 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  7 Jun 2023 17:24:25 +0200
Message-Id: <20230607152432.5435-1-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, this patchset is supposed to replace the last patch in
 the patchset cleaning up after introducing the buddy detector,
 see
 https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f35b343
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6v23-0003Ju-Np
Subject: [Kgdb-bugreport] [PATCH 0/7] watchdog/hardlockup: Cleanup
 configuration of hardlockup detectors
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

this patchset is supposed to replace the last patch in the patchset cleaning
up after introducing the buddy detector, see
https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid

There are four possible variants of hardlockup detectors:

  + buddy: available when SMP is set.

  + perf: available when HAVE_HARDLOCKUP_DETECTOR_PERF is set.

  + arch-specific: available when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.

  + sparc64 special variant: available when HAVE_NMI_WATCHDOG is set
	and HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.

Only one hardlockup detector can be compiled in. The selection is done
using quite complex dependencies between several CONFIG variables.
The following patches will try to make it more straightforward.

Before, the decision was done using the following variables:

	+ HAVE_HARDLOCKUP_DETECTOR_PERF
	+ HAVE_HARDLOCKUP_DETECTOR_BUDDY
	+ HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ HAVE_NMI_WATCHDOG
 
	+ HARDLOCKUP_DETECTOR
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY

	+ HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
	+ HARDLOCKUP_DETECTOR_NON_ARCH

	+ HARDLOCKUP_DETECTOR_PERF
	+ HARDLOCKUP_DETECTOR_BUDDY

   and the particular watchdog was used when the following variables were set:

	+ perf:		 HARDLOCKUP_DETECTOR_PERF
	+ buddy:	 HARDLOCKUP_DETECTOR_BUDDY
	+ arch-specific: HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ sparc64:	 HAVE_NMI_WATCHDOG && !HAVE_HARDLOCKUP_DETECTOR_ARCH


After, the decision is done using the following variables:

	+ HAVE_HARDLOCKUP_DETECTOR_PERF
	+ HAVE_HARDLOCKUP_DETECTOR_BUDDY
	+ HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ HAVE_HARDLOCKUP_DETECTOR_SPARC64
 
	+ HARDLOCKUP_DETECTOR
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY

	+ HARDLOCKUP_DETECTOR_PERF
	+ HARDLOCKUP_DETECTOR_BUDDY
	+ HARDLOCKUP_DETECTOR_ARCH
	+ HARDLOCKUP_DETECTOR_SPARC64

   and the particular watchdog is used when one of these variables is set:

	+ perf:		 HARDLOCKUP_DETECTOR_PERF
	+ buddy:	 HARDLOCKUP_DETECTOR_BUDDY
	+ arch-specific: HARDLOCKUP_DETECTOR_ARCH
	+ sparc64:	 HARDLOCKUP_DETECTOR_SPARC64


Plus, many checks are more straightforward and even self-explanatory.

I build and run tested it on x86_64. I only checked the generated
.config after using sparc_defconfig, sparc64_defconfig, ppc64_defconfig,
and ppc40x_defconfig.

Best Regards,
Petr

Petr Mladek (7):
  watchdog/hardlockup: Sort hardlockup detector related config values a
    logical way
  watchdog/hardlockup: Make the config checks more straightforward
  watchdog/hardlockup: Declare arch_touch_nmi_watchdog() only in
    linux/nmi.h
  watchdog/hardlockup: Enable HAVE_NMI_WATCHDOG only on sparc64
  watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to
    HAVE_HARDLOCKUP_WATCHDOG_SPARC64
  watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
  watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH

 arch/Kconfig                   |  17 ++---
 arch/powerpc/Kconfig           |   5 +-
 arch/powerpc/include/asm/nmi.h |   2 -
 arch/sparc/Kconfig             |   2 +-
 arch/sparc/Kconfig.debug       |  20 ++++++
 arch/sparc/include/asm/nmi.h   |   1 -
 include/linux/nmi.h            |  14 ++--
 kernel/watchdog.c              |   2 +-
 lib/Kconfig.debug              | 115 +++++++++++++++++++--------------
 9 files changed, 104 insertions(+), 74 deletions(-)

-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
