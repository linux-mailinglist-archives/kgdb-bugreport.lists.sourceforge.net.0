Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F1B3C5DA3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Jul 2021 15:47:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m2wHH-0001I8-I2
	for lists+kgdb-bugreport@lfdr.de; Mon, 12 Jul 2021 13:47:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sumit.garg@linaro.org>) id 1m2wH3-0001HD-UL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 13:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hkyO8imEL0+DUAAtvz5beSJFhYFF7552OLN4p+89W8M=; b=NLCJmoGslqy5t67ychPChe9yLA
 nCQQywkNH6I/INdAjS8CqvEnKE+TtRYJT42ZgFNrb4nUDwv+BpFOFEUw0mPa4FjtbMNUp+odDsv2S
 7s8gzJDIkKwBSm+o+KRW3T38Cbw2RZDxZzrBqzdLOmHxsT4grUATc5saMwaUoNrWgO/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hkyO8imEL0+DUAAtvz5beSJFhYFF7552OLN4p+89W8M=; b=H
 l88NH/i7NqjA6hUphZflKPrvhhG8s00KiMtJ0AD2+EOqMgU3PMyhXXth/ih7U+sCMW0CY9zjoYW5N
 CVen8V9hKfMbFBDIQ+LxlsItY8kh62eQA+CyNsNOEFlQIMo+KEk0fjCd/hhhShTeWh8XqszObF3zZ
 QcfhekAJI2cf825c=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m2wGk-0007pg-Pe
 for kgdb-bugreport@lists.sourceforge.net; Mon, 12 Jul 2021 13:46:59 +0000
Received: by mail-pj1-f41.google.com with SMTP id n11so10157205pjo.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 12 Jul 2021 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkyO8imEL0+DUAAtvz5beSJFhYFF7552OLN4p+89W8M=;
 b=wtuJcrv79psn5e7ySL+Uc5JkU75XGINeXdYj2rN07URLOREmnYlcnk558ONCarvXgm
 hAOoRDCp533iiso1JfUQ+Au1CsVBVTaDvskwsNVrNAcACJFBKeAX9mQSIp8PWp23MqEQ
 826Q42x3fUYBYPzxxjq8GcG+HYP1mzC7XrZgpJizWuHNLZAsrBPHDoHe5Ty2ExvhJmQ/
 pwKFzNx6QG224TLCWEi+dujOqyCfuRgW3DDzQrVSrl6w7+crS6tmu5mb/MLPLLGtxXi3
 nTWg8x0pGkJOVPP3jCQWoEWdGr4TPJP1aBHBGFbf67RBkWTp15KBPA35nw6J4FmpcMKl
 GJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkyO8imEL0+DUAAtvz5beSJFhYFF7552OLN4p+89W8M=;
 b=HMzS6MI7imhZKpe7RTwHTrbRgNP1JOPb8vonzckYJcnEV7jnWbTtM8s8vYDmsj+Xee
 NXWZUSEqCEb61gQ6g9cXdBiGyUuhQALsFAPO/ovJFf96leY7qVwbEhc/yQ6VvdY227yx
 Prlyd4byJvL5sGT3V7EbMP6ATQI70Y+24jiwYs1+MNDi7CCqOvNQANIWI3Zl71jfRgoO
 GK5+8zw6Ai3zMLmRVYR4fjwr5ZIneBPI0CSfaKWP48pP7oDjmnWgOndz2SlyTq0d+0bK
 LoPgc7zc9JQvwgEAbFfJPquQmd0Z/sxLYPc5u54wu58reUsMYao17HWMAdJP5GhdvaxS
 u83w==
X-Gm-Message-State: AOAM5324+4awbousoZxOHRo0b6gVQch72nA0YHAdiiSdWYWqbT0h+DDw
 y0EQ3F41pXJS50XJJF2+FiKLtp04PNNZ9w==
X-Google-Smtp-Source: ABdhPJwNZFPUeOpgzYKGNZPF3XCdDIAoMhVO0IrZ4VfxWU1YxtO57hBU+lYfP2LHLvLxklhl0dVimw==
X-Received: by 2002:a17:90a:1704:: with SMTP id
 z4mr14617653pjd.213.1626097600772; 
 Mon, 12 Jul 2021 06:46:40 -0700 (PDT)
Received: from localhost.localdomain ([223.178.210.84])
 by smtp.gmail.com with ESMTPSA id z13sm835405pfn.94.2021.07.12.06.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 06:46:40 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Mon, 12 Jul 2021 19:16:16 +0530
Message-Id: <20210712134620.276667-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.41 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m2wGk-0007pg-Pe
Subject: [Kgdb-bugreport] [PATCH v5 0/4] kdb code refactoring
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
Cc: daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Some more kdb code refactoring related to:
- Removal of redundant kdb_register_flags().
- Simplification of kdb defcmd macro logic.

Tested with kgdbtest on arm64, doesn't show any regressions.

Changes in v5:
- Incorporated minor comments from Doug.
- Added Doug's review tag.

Changes in v4:
- Split rename of "defcmd_set" to "kdb_macro" as a separate patch.
- Incorporated misc. comments from Doug.
- Added a patch that removes redundant prefix "cmd_" from name of
  members of struct kdbtab_t.

Changes in v3:
- Split patch into 2 for ease of review.
- Get rid of kdb_register_flags() completely via switching all user to
  register pre-allocated kdb commands.

Changes in v2:
- Define new structs: kdb_macro_t and kdb_macro_cmd_t instead of
  modifying existing kdb command struct and struct kdb_subcmd.
- Reword commit message.

Sumit Garg (4):
  kdb: Rename struct defcmd_set to struct kdb_macro
  kdb: Get rid of redundant kdb_register_flags()
  kdb: Simplify kdb_defcmd macro logic
  kdb: Rename members of struct kdbtab_t

 include/linux/kdb.h            |  27 +-
 kernel/debug/kdb/kdb_bp.c      |  72 ++--
 kernel/debug/kdb/kdb_main.c    | 626 +++++++++++++++------------------
 kernel/debug/kdb/kdb_private.h |  13 -
 kernel/trace/trace_kdb.c       |  12 +-
 samples/kdb/kdb_hello.c        |  20 +-
 6 files changed, 357 insertions(+), 413 deletions(-)

-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
