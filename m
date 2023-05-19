Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6C70A951
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 20 May 2023 18:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q0PrA-0004af-7v
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 20 May 2023 16:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q03ms-0007zt-NG
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DMiz3to86FkP1q0hsF+Wqo3XfK/5ADGMUL6fQvRPMH0=; b=fLQCPiX5gaBUIA6vUOcqCMV1Jc
 9Xx6csh9bjZzsrHQvnzXVAMJ4AfqeuZr6zr2mTCfmmDLBdYG1h4p/OgPBZm/xC+5yb6Jw76xmarPB
 I6jVFlkPz58a9JMBkq1QvGbYsABhd7UaBssOw/ibPxMsiLSuLrlofM10spTbJ3on41zE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DMiz3to86FkP1q0hsF+Wqo3XfK/5ADGMUL6fQvRPMH0=; b=Itgofshd2qwLJ3QYXfvkcnBt+n
 1PMiB58lzgrci4xThViL9JZXE4W/0nnzMBd+apUp9aqsgMacSz7I4o2fzdhJBKyY7gRRjxOye3k+v
 j9hjTry2ojaxPRWDq+4WwtNmsRwt+Ndxtsxo+uMkEcYr8gHWMGE1CQYLd964ch0atBJg=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q03md-00076W-0D for kgdb-bugreport@lists.sourceforge.net;
 Fri, 19 May 2023 17:20:58 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-517c840f181so1899841a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 May 2023 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684516845; x=1687108845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMiz3to86FkP1q0hsF+Wqo3XfK/5ADGMUL6fQvRPMH0=;
 b=Cx6hTxwoprK8nUSIr03lPivHKWjjrogjswRvDLx9AuLo18B3eXilhScKopQDoLt8fc
 +q6ht7zyx2kXwb9NKPseHI6ovEC8lXOX8XuINlRUG9Or8F+YWU6HTqNhrvahAhe/CDpz
 7qq4gMO1UU4e69rpklfI1U8z/wIJemk+nXOfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516845; x=1687108845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DMiz3to86FkP1q0hsF+Wqo3XfK/5ADGMUL6fQvRPMH0=;
 b=GiCI/00pOZ39LDsyGwsHtv+Q64Z8e9XDpZT43heUtcYWE0VEEfn4h5ck7ERr6iwRzd
 VQhY8qkGKwhDgnOTKaDABJbfnzy3kpLcBkYVIU1sJkkXwnUqFJpifc4Z9cReu9AshM83
 Jvab+mB9waA9o4hlbvHoBxN6FHkXmPJUoTfJAiFboyav6TaZ9iCDjlIgwWyxO6HPdkT1
 qwvzsfd7dcTf37qvNR070dQGl5eoYilc72xr/+au88hgX1kf3uqk7vpblpx+SoEODL59
 V+mrC4zjdcDwQlxnkODpH2N3fpVpScRqtNFfbWjgQ5edE23OTDANJmeG4xyeJkHRZLr+
 RTRA==
X-Gm-Message-State: AC+VfDwaDc08DAhOKZYOjFqKS96aA1v6MwsPJzTrfYoON4gZbNTvCmy0
 MzdTX3ubF74rUhW4NkG9Dc3dZA==
X-Google-Smtp-Source: ACHHUZ4HcaPYNuvTP98WNkT/ggUfrWqySpDY3N2DHz7bGp2lSbc/FwZeje+nmx1Ot7R1VAg4t1jRIQ==
X-Received: by 2002:a17:90a:d105:b0:23f:6d4e:72b3 with SMTP id
 l5-20020a17090ad10500b0023f6d4e72b3mr2809893pju.25.1684516845320; 
 Fri, 19 May 2023 10:20:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9b89:2dd0:d160:429d])
 by smtp.gmail.com with ESMTPSA id
 gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:20:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 19 May 2023 10:18:27 -0700
Message-ID: <20230519101840.v5.3.I6a729209a1320e0ad212176e250ff945b8f91b2a@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Lecopzer Chen <lecopzer.chen@mediatek.com> No reference
 to WATCHDOG_DEFAULT,
 remove it. Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
 Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com> Reviewed-by: Petr
 Mladek <pmladek@suse.com> Signed-off-by: Douglas Anderson <dianders@chromi
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q03md-00076W-0D
Subject: [Kgdb-bugreport] [PATCH v5 03/18] watchdog: remove WATCHDOG_DEFAULT
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
 ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com,
 Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, christophe.leroy@csgroup.eu,
 Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com,
 Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com,
 Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Lecopzer Chen <lecopzer.chen@mediatek.com>

No reference to WATCHDOG_DEFAULT, remove it.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together. This is a nice cleanup and could land together
with the rest of my series if that makes sense.

I changed the patch prefix to match others in my series.

[1] https://lore.kernel.org/r/20220903093415.15850-2-lecopzer.chen@mediatek.com/

(no changes since v4)

Changes in v4:
- Pulled ("remove WATCHDOG_DEFAULT") into my series for v4.

 kernel/watchdog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 8e61f21e7e33..582d572e1379 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -30,10 +30,8 @@
 static DEFINE_MUTEX(watchdog_mutex);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR) || defined(CONFIG_HAVE_NMI_WATCHDOG)
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED | NMI_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	1
 #else
-# define WATCHDOG_DEFAULT	(SOFT_WATCHDOG_ENABLED)
 # define NMI_WATCHDOG_DEFAULT	0
 #endif
 
-- 
2.40.1.698.g37aff9b760-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
