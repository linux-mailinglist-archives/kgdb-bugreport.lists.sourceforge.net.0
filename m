Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9C1E3921
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 08:26:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdpWY-0007VY-Fb
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 06:26:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdpWW-0007VQ-V3
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NFiMTgw0ePYgZ5AyHST8V5BcX0V74DYgO0bygQd/V6E=; b=UjGx9AFA0p9jVR6YYmTD7T1eNO
 KLYDeZ69dn+tjdI4FDJWWyScYcgxVp789IWo8VubBeqx/SwikN91XFj8VtC5HUmNU7MUtgcYSeQmm
 h9auCoTwQEEljEH8JK/CeiSlC1GuPa5OGDei6kN9MWIyxXVuSvGY3LtCHo6r6Mjar1A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NFiMTgw0ePYgZ5AyHST8V5BcX0V74DYgO0bygQd/V6E=; b=H+I1T8RCjMwN1IT6wkhIo+rUkN
 Tzpk6lBojAgAoM3/k/hI5mIzpQse6A222Q4BjpACqO76eDJmpXiYz3a8pQWrnVCwmuFb7hJ0kSqaK
 b9qvEPxpXL/yMmLd2rhsfJk5WzQRftqK0hZY7CohD4FKKqr4fxvBr5jdp7pOvfQB14CQ=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdpWR-00EU6s-SB
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:44 +0000
Received: by mail-pj1-f68.google.com with SMTP id q24so1079522pjd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 23:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=NFiMTgw0ePYgZ5AyHST8V5BcX0V74DYgO0bygQd/V6E=;
 b=W1TUEkRQ5Et/Gi/4hnXRc57eLV8qfnmL/DpnDGe/EEnVdgwb2b4l8jZoerXxO+frUA
 6ElMY5TVa0KQLO045gdJZKmMzZJqqHRNdYMiiPDGkg5A2zwgXl0CrqGAaiMpATKxoLPt
 aYs4H0zLKP5YRKR9sWl6d2HsiXgOjKkFb/521j0ZHSvDIbK61iHeTFkW85nCaO54N1eX
 0OMr55J9Y/oSaNG9vTG0ovEjuU/oYbAY0LFFUF7/N7Xw6TKEFxSz/g0vUl+8OZo6xkCT
 bQ28cMt6uD+F7MqZyTfq2fS3hl5QxXCCuhJWXGjdGyVG6e2Mwa9DNb5w4DpeGE4yRw8V
 U6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NFiMTgw0ePYgZ5AyHST8V5BcX0V74DYgO0bygQd/V6E=;
 b=ikuoJFT6aOPYNSPYaY9k92XMdpo3D1x+XOUV62t3VQ3ykoIA8Zf3PYenTZKNbSQPAe
 ExMEWCZbnEvHlWuwUYiFEwxy/M8rFPPU5D6pmsi2J2f2aAYISC2sX1O1bPpMlCPxxdSo
 hqzwb7rcv67+8F4bDaunC5/FAtP1UCLwZytOegfppTutOKj8rk4yE4K9khOT2PIqO3vS
 G4SKpl0ONKlZphsgyM9SgfWx6+9ttMtG0hV6PLwvLV8boDOnsvUv5dVdngnbQPcSPMMq
 qR65r/PIPox+vf0g7624MSXM1PtqMWq5Kmbl+cMDvjq3zZFQiVW4AtRhyShi+eOxNWEv
 0fHQ==
X-Gm-Message-State: AOAM531JvGv0tgpukZTMEKu9mqGcCyOhrT3uF2xOYrTe5Six5o7hccUd
 Vuj/cxV17UEZBKHomfi9qcu0lQ==
X-Google-Smtp-Source: ABdhPJyt10+/ExgeuNOKd96RcWJXrRobqoF7VU0IB/YAfA5mguNqVDiqNUr4L69k6MBw6GL7rqEMsw==
X-Received: by 2002:a17:902:9a4a:: with SMTP id
 x10mr4620273plv.343.1590560794197; 
 Tue, 26 May 2020 23:26:34 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id m12sm1239121pjs.41.2020.05.26.23.26.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 23:26:33 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed, 27 May 2020 11:55:55 +0530
Message-Id: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jdpWR-00EU6s-SB
Subject: [Kgdb-bugreport] [PATCH v3 0/4] kdb: Improve console handling
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This patch-set is aimed to improve console handling especially when kdb
operates in NMI context.

Brief description of enhancements:
- Add status check for console prior to invoking corresponding handler.
- Fixup to avoid possible deadlock in NMI context due to usage of locks
  in the console handlers.
- Prefer usage of polling I/O driver mode (lockless APIs) over invocation
  of console handlers.

Changes in v3:
- Split patch to have separate patch for console status check.
- New patch to re-factor kdb message emit code.
- New patch to prefer polling I/O over console mode.
- Add code comments to describe usage of oops_in_progress.

Changes in v2:
- Use oops_in_progress directly instead of bust_spinlocks().

Sumit Garg (4):
  kdb: Re-factor kdb_printf() message write code
  kdb: Check status of console prior to invoking handlers
  kdb: Make kdb_printf robust to run in NMI context
  kdb: Switch kdb_msg_write() to use safer polling I/O

 drivers/tty/serial/kgdboc.c | 17 ++++-----
 include/linux/kgdb.h        |  2 +
 kernel/debug/kdb/kdb_io.c   | 91 ++++++++++++++++++++++++++++++---------------
 3 files changed, 72 insertions(+), 38 deletions(-)

-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
