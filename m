Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948D71319F
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 27 May 2023 03:42:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q2ix6-0003KW-UB
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 27 May 2023 01:42:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q2ix3-0003KP-Ug
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=; b=SnnQeXoHE9UFPCcUQSoehwI2wz
 j8xWUEZ6KN5ads6yD7X7HBsFLPlZ4c2Ax2FypiM/lawRcdr4plJcj/JkqnxMFcekCw7oWOMdL9UEb
 3Tz+s/vfbr3ohzsune0iJQX+7f6u1yvuGJheq8Er1AMPDQlnX6Nf6o6bSEuAEKGbYfgQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=; b=ms0rHRPkVzalMsVm/VuS4czI+j
 ZYPilgrSApfarPxsF/Mp6aQMoLgtrid8YwizA1fA+/NMapYfNWuCRnnNW8g/Z/ZAAl7ZYmho6rB/3
 CW6A5ImbbmGR2/GUkZgXBGL9YbKiUQJinelnfUyRsX+4YzbcC8vqSJwCzrMV019nqcfY=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q2ix0-0002sj-3v for kgdb-bugreport@lists.sourceforge.net;
 Sat, 27 May 2023 01:42:37 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-64d57cd373fso1972061b3a.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 May 2023 18:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685151748; x=1687743748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=;
 b=Q025PITc8JDv9dJTfN7tctFHTJNnpaJy29WWhsH2ZPNUoOboOZYviwhQysV0Gmhli6
 56fngg0HA+HuSP7ILjSstqS+Mhqo+R8NkGbp1+jpakojtJHDkgDTve7zASH3nWRB6R5B
 bOOBqThle1HJJLIUfe8O4ba5IMukCJE/7Qfis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685151748; x=1687743748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cAUIzM0ipEZnJ+DKEACmhXTzJMTqgJKwduhWCKwpQIQ=;
 b=iHM9Mp9zNMfgk2a0e5VwRyMMsu8Wg3O61m1ZtCy2vZ4EqRnsgAZmKGjrNUg9w9fy7Q
 Gez2yotTJIwf3KTRphO6qFLadl1eBqwy9+5LzRKC9YaKtOxOaPktYdQNRvFR9dKtoJc2
 eWl7vWZa7bCtHvzIL/v/Uu4gPk4X9BDz5Xj4SXXqV1mPv4CXenvUE/ZEBG5QLaTOAC+e
 ZloG59K+dStFg5muvu95Zl6c5h8Es+oakgKKHZEQRv1Cc5L2HAPFpklj0vVqGJfMU8Nn
 5vcwoF4IjYcAuY7Nh8/dg8AYp4IOJjHU/gmAzGaey1P+Y/TmXuyV5cZmFV1FG7O4+cuv
 m7hQ==
X-Gm-Message-State: AC+VfDyeCslmEVD4jio5MTJ43av14EeQ6y6KQLVwRhZSBv64cgvrMjK8
 Ob+I3GlYNazvS8deTU6AB/7xuw==
X-Google-Smtp-Source: ACHHUZ7CuB7PPQInlPEZH0k1cEJvxZtnt0cbbm9xAfq9bZv1LojzgB0/25WLra3jsMmghAsHAYATEg==
X-Received: by 2002:a05:6a20:7351:b0:105:3e47:7504 with SMTP id
 v17-20020a056a20735100b001053e477504mr902971pzc.11.1685151748589; 
 Fri, 26 May 2023 18:42:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4015:7255:c79a:26d7])
 by smtp.gmail.com with ESMTPSA id
 x25-20020aa79199000000b0063b8ddf77f7sm3202440pfa.211.2023.05.26.18.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 18:42:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 26 May 2023 18:41:37 -0700
Message-ID: <20230526184139.7.If466f9a2b50884cbf6a1d8ad05525a2c17069407@changeid>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
In-Reply-To: <20230527014153.2793931-1-dianders@chromium.org>
References: <20230527014153.2793931-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There's no reason to make a copy of the "watchdog_cpus"
 locally
 in watchdog_next_cpu(). Making a copy wouldn't make things any more race
 free and we're just reading the value so there's no need for a [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2ix0-0002sj-3v
Subject: [Kgdb-bugreport] [PATCH 07/10] watchdog/buddy: Don't copy the
 cpumask in watchdog_next_cpu()
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
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

There's no reason to make a copy of the "watchdog_cpus" locally in
watchdog_next_cpu(). Making a copy wouldn't make things any more race
free and we're just reading the value so there's no need for a copy.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/watchdog_buddy.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
index 3ffc5f2ede5a..2ef88722c5e7 100644
--- a/kernel/watchdog_buddy.c
+++ b/kernel/watchdog_buddy.c
@@ -10,12 +10,11 @@ static cpumask_t __read_mostly watchdog_cpus;
 
 static unsigned int watchdog_next_cpu(unsigned int cpu)
 {
-	cpumask_t cpus = watchdog_cpus;
 	unsigned int next_cpu;
 
-	next_cpu = cpumask_next(cpu, &cpus);
+	next_cpu = cpumask_next(cpu, &watchdog_cpus);
 	if (next_cpu >= nr_cpu_ids)
-		next_cpu = cpumask_first(&cpus);
+		next_cpu = cpumask_first(&watchdog_cpus);
 
 	if (next_cpu == cpu)
 		return nr_cpu_ids;
-- 
2.41.0.rc0.172.g3f132b7071-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
