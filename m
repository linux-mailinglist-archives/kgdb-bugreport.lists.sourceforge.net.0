Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E3733435
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 16 Jun 2023 17:06:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1qAB2L-0002PT-QQ
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 16 Jun 2023 15:06:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pmladek@suse.com>) id 1qAB2J-0002PM-16
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZ6VZQS2BN5LQfBVveeEUMRRjzGIEjqa48tMNDm1o3M=; b=X00IqwfRxRG/HN4XqI7DZNPNL0
 CnV0+5zkhV8e+4Ue3Oukmr1TK7feI9xvD4k6a2fFTS10J1uDKlV8HPt13P117H/i1p8ZD+C+uDWMF
 4GN1pgJf6YJDQ9QD+UosNScXkszRzSK5OpAGpJoXQF5dFLbtAsgpTZ69zQFLWkABI/RM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qZ6VZQS2BN5LQfBVveeEUMRRjzGIEjqa48tMNDm1o3M=; b=S
 1+RRSxG8Ad7KYjzS3/VknKvk420h1X9Es8Dc8c02Tiz3w4mOQyPG35PCS1bHKR0eF+Ifs/IY5cbCr
 Vy8v1EgktV8FRZSX4zrgiSAI0UVKL4OLHd2Tk8fqC1FW+tQghN4jHJ63X12yB+p8+M9mnqvGS0Hfp
 PkZzSwJQhXR3CeyQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qAB2F-005sqo-J1 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 16 Jun 2023 15:06:51 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AAD451F461;
 Fri, 16 Jun 2023 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1686927997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qZ6VZQS2BN5LQfBVveeEUMRRjzGIEjqa48tMNDm1o3M=;
 b=NflyOErmcWSy+bqbtbwYQTBDVsUvpIBLG317dBlbNwgfNzOSCxizJowUuCAURsAnkD7DwK
 QoPX51bOLIvjmQTV4fFPPqGTczXM60o0DLmH1lfZlAyO1QpZtSAew7zY9nuuVJr4wdEqDU
 xURFTUWprpCM15XrbRool9W6zsGrsJ0=
Received: from alley.suse.cz (unknown [10.100.208.146])
 by relay2.suse.de (Postfix) with ESMTP id 242E32C141;
 Fri, 16 Jun 2023 15:06:36 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 17:06:12 +0200
Message-Id: <20230616150618.6073-1-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qAB2F-005sqo-J1
Subject: [Kgdb-bugreport] [PATCH v2 0/6] watchdog/hardlockup: Cleanup
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

Changes against v1:

  + Better explained the C-like ordering in the 1st patch.

  + Squashed patches for splitting and renaming HAVE_NMI_WATCHDOG,
    updated commit message with the history and more facts.

  + Updated comments about the sparc64 variant. It is not handled together
    with the softlockup detector. In fact, it is always build. And it even
    used to be always enabled until the commit 7a5c8b57cec93196b ("sparc:
    implement watchdog_nmi_enable and watchdog_nmi_disable") added in
    v4.10-rc1.

    I realized this when updating the comment for the 4th patch. My original
    statement in v1 patchset was based on code reading. I looked at it from
    a bad side.

  + Removed superfluous "default n"
  + Fixed typos.

Petr Mladek (6):
  watchdog/hardlockup: Sort hardlockup detector related config values a
    logical way
  watchdog/hardlockup: Make the config checks more straightforward
  watchdog/hardlockup: Declare arch_touch_nmi_watchdog() only in
    linux/nmi.h
  watchdog/hardlockup:  Make HAVE_NMI_WATCHDOG sparc64-specific
  watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
  watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH

 arch/Kconfig                   |  17 ++---
 arch/powerpc/Kconfig           |   5 +-
 arch/powerpc/include/asm/nmi.h |   2 -
 arch/sparc/Kconfig             |   2 +-
 arch/sparc/Kconfig.debug       |  14 ++++
 arch/sparc/include/asm/nmi.h   |   1 -
 include/linux/nmi.h            |  14 ++--
 kernel/watchdog.c              |   2 +-
 lib/Kconfig.debug              | 114 ++++++++++++++++++---------------
 9 files changed, 97 insertions(+), 74 deletions(-)

-- 
2.35.3



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
