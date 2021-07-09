Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A27F33C2271
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  9 Jul 2021 12:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1nzI-0007MF-Ef
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 10:44:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1m1nzH-0007M8-10
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2xtCVXf4qFyJO09lCUbN2X8PkUmLUwY+9c820BNHvM=; b=Zj4RGrQmEL9lnSeyysJePtvu0f
 43ftdfDi+VhbeHlT+MjGiXG79EFPcmIeAamfg8NZCPUiDmx/Z43e2vBnYO0WCtFAOJ1flanblGG+m
 6k5QpR4uKgIQEHet5YpIWpUpRZtxbgwfbioV5t+jEcW8cCmbwPnUJK561c3mdH2keRkg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e2xtCVXf4qFyJO09lCUbN2X8PkUmLUwY+9c820BNHvM=; b=H
 MS9dlEVHHtNRBAp6jhXFklT3USu8CCAuprDZOlCxiHShGO+enn1WqIZwFHhZhMfWjLbR6CgDdblG4
 /uWKWP1hfrJE8h51SaHAIGQmYWbNikB9CLfh0rClG5LNNkUIgOBHe9VtThxQgrs/RHxkgLR0PmOvK
 vz3LW4XD9RJpD6Iw=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1nz2-0000hH-0N
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 10:44:02 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so5689815pju.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2xtCVXf4qFyJO09lCUbN2X8PkUmLUwY+9c820BNHvM=;
 b=mD/5FkGeY8CC+sRbePxQr3O7Qe3khAYm+b1XWsKJAAB2bWOVa481+u5P9oPGhnb+zf
 LYREjSnrGtQclutvHcpOSgUo7/RjpZCxDzjHm/WCKGwZlkHc7yqvhvHZ4VgDnFxd8idG
 kodE5ChALW+5jILMqQqcoI84DsDJVq9arPjIA4gAxald74TIq7+9Oj8+2UBiAGoPJ0TU
 Hz6cmVGba1BfLpQNQ9i6ucdhXJkXqmrm0R+jkPRXYSTHz8CMIVMppSeysEl/De8sQXPA
 duc3HUAqpPS3oFXqFni+FT8x4FDL8CvZgS3EA6D1lDCyk7Be594fkK2rlpuRDJdKfi9t
 XBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e2xtCVXf4qFyJO09lCUbN2X8PkUmLUwY+9c820BNHvM=;
 b=bnMhlXVqBDo0aGyClxfH7Tn0DHOF9etB6SAQy/BUqejS3DRhnZ8Nynr2zjt2jwQ3aC
 z3OC8o3g+WEEbCRb+4r19cLSyo43qBHAYmrIc6iDlW2VMEB4ayJE5/6XWUJxVVdWm8tr
 4uMDG1SrgQ/OYlIIwZFCHsL6ov2ZfR0gZR/vrsAdx7XK3bAzUHU9GaTomyG1xK7yVSwk
 AljrnVVGiysd0CaFrrAacuDda3SpTLPucAgWf5V+7cTtry2/PmygQkJepv6TMrvITytc
 XY0aJENOzdY1y2nEUTOLTAobhSe8ttegNxTg8apfszj2V9Bo51NC7Ha4+r1hB5VYJPQb
 LWfQ==
X-Gm-Message-State: AOAM533UEiPXm7/Tme8Xs8SZLNN5eRpX0tP9+kf05ZV8uj9jjIAcH/eI
 2t5bSCcMzDwU522XnAQr9ymKujvNZ9O3YQ==
X-Google-Smtp-Source: ABdhPJz+XsbromyvKZFDZvlwaF5UYmGcijoRhGNPzYLjV+CAP2c9o7lavKGRM7A8pKg/aw2plRsc6A==
X-Received: by 2002:a17:903:22c4:b029:129:8878:f872 with SMTP id
 y4-20020a17090322c4b02901298878f872mr23264090plg.74.1625827421831; 
 Fri, 09 Jul 2021 03:43:41 -0700 (PDT)
Received: from localhost.localdomain ([223.178.210.84])
 by smtp.gmail.com with ESMTPSA id 1sm17479pfv.138.2021.07.09.03.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 03:43:39 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri,  9 Jul 2021 16:13:16 +0530
Message-Id: <20210709104320.101568-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.42 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m1nz2-0000hH-0N
Subject: [Kgdb-bugreport] [PATCH v4 0/4] kdb code refactoring
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
  kdb: Rename struct defcmd_set to struct kdb_macro_t
  kdb: Get rid of redundant kdb_register_flags()
  kdb: Simplify kdb_defcmd macro logic
  kdb: Rename members of struct kdbtab_t

 include/linux/kdb.h            |  27 +-
 kernel/debug/kdb/kdb_bp.c      |  72 ++--
 kernel/debug/kdb/kdb_main.c    | 628 +++++++++++++++------------------
 kernel/debug/kdb/kdb_private.h |  13 -
 kernel/trace/trace_kdb.c       |  12 +-
 samples/kdb/kdb_hello.c        |  20 +-
 6 files changed, 359 insertions(+), 413 deletions(-)

-- 
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
