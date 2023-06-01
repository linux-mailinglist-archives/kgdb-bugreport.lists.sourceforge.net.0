Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BC371F4DE
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  1 Jun 2023 23:37:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1q4pz4-0005Bu-E4
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 01 Jun 2023 21:37:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1q4pz2-0005Bn-Ix
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MfGBHBvKGGFx2dApaWUV0FsGkRnAHULREps6A6RYWJ4=; b=OO+J5rwXX1w3Z1PgVUo1RuIJff
 Lv1ComKe2XURirPChG4xfjAKjirOYHAxCBFQIhektp80X/CkweH2U7cJVc9kIrYEuiaJGRNpQaRFH
 bY49MHpSonfNVplPJ0fnpmOEHYRsY70rqbNE6vwu1E46N66gNBd3TqQHsZEniTVzoUVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MfGBHBvKGGFx2dApaWUV0FsGkRnAHULREps6A6RYWJ4=; b=BevtLPDkei4fUaC678Bb2jWKzR
 UntGWC9IQdWHjWLkN9ZxzPQodF4Atv89Q4b4CWfEOQG0dZX/0Xo2YFM+Ua8XuAF+S0DwEa/ZcuNxu
 T4YS2R6bJcB+YmzvWJVXAAtXxYvXoFW860Am9cJN6fUJBnbfTzina1r3NCC6TooUPwOE=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4pz2-008k4W-B9 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 01 Jun 2023 21:37:24 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-53f04fdd77dso673151a12.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 01 Jun 2023 14:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685655439; x=1688247439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MfGBHBvKGGFx2dApaWUV0FsGkRnAHULREps6A6RYWJ4=;
 b=AkgOfxeqMJ+Uowmkx4hw7IQZ50qdy2xVCPyodSzFbID79vkX/uuep2hjtkAVQf+ZMY
 2Ois27dY1aNRlYZc7JAHlkdtHKB/6T3f05uoIAoto3JEclpb7k9RtEHCD6+WC8K9AjHR
 0/+O26QCTSXFLaWGDuAgWq5b1oezjD46LgHAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685655439; x=1688247439;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MfGBHBvKGGFx2dApaWUV0FsGkRnAHULREps6A6RYWJ4=;
 b=iW+eGhRqyC6pCYSAwztXzUUXQunI+TGDQK2+PX0An1IKMHhdfgDWu50u1brymvJ6GU
 hxRFTrQHD1lrDb8IUVEV+C86HxoFUk19eE5ZHyBgILwp/lW/ZUk7RURN6CUJ/6A8KkAG
 pSJQ8HVZ4W6TGu6mWIgEntTJ+fi1yo94q4e8RbRgFZTIp0cyE906dukIofXTeE3mR/VU
 PdLqNA4CIKShM9eVxA/zI2XmD/LfXAovFpdghAfLo0Z2FlhjPTbSLe4Ol+xAH8bhHeDg
 s0gQ4MpkgLhY5KR3JZoLxpEVS/Jroyp3BQJho4zsR9uxvvt6+qkQSOhxqZMZCqsPcqEF
 GP5Q==
X-Gm-Message-State: AC+VfDxrJkwYTZWq407bSAykot7dGTdKR/uZakammgNj1UOkUcs9G5gH
 /UK5+jmqJmA7tcHIO8WELHm8hA==
X-Google-Smtp-Source: ACHHUZ6c761aOPieAnWSz/n26mxi7TuDnyom5n4cFPpm2ooQ6JFhgncQbyJIHjA9N7SSHuxDQFh8Yw==
X-Received: by 2002:a05:6a20:1583:b0:10f:759d:c5b2 with SMTP id
 h3-20020a056a20158300b0010f759dc5b2mr8808767pzj.45.1685655438667; 
 Thu, 01 Jun 2023 14:37:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11b8:2d2:7e02:6bff])
 by smtp.gmail.com with ESMTPSA id
 g22-20020aa78756000000b0064d48d98260sm5319534pfo.156.2023.06.01.14.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 14:37:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Marc Zyngier <maz@kernel.org>
Date: Thu,  1 Jun 2023 14:31:50 -0700
Message-ID: <20230601143109.v9.6.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
In-Reply-To: <20230601213440.2488667-1-dianders@chromium.org>
References: <20230601213440.2488667-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To save architectures from needing to wrap the call in
 #ifdefs, 
 add a stub no-op version of kgdb_nmicallback(), which returns 1 if it didn't
 handle anything. Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
 Signed-off-by: Douglas Anderson <dianders@chromium.org> --- In v9 this is
 the only kgdb dependency. I'm assuming it could go through the arm64 [...]
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4pz2-008k4W-B9
Subject: [Kgdb-bugreport] [PATCH v9 6/7] kgdb: Provide a stub
 kgdb_nmicallback() if !CONFIG_KGDB
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

To save architectures from needing to wrap the call in #ifdefs, add a
stub no-op version of kgdb_nmicallback(), which returns 1 if it didn't
handle anything.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In v9 this is the only kgdb dependency. I'm assuming it could go
through the arm64 tree? If that's not a good idea, we could always
change the patch ("arm64: kgdb: Roundup cpus using IPI as NMI") not to
depend on it by only calling kgdb_nmicallback() if CONFIG_KGDB is not
defined.

Changes in v9:
- Added missing "inline"

Changes in v8:
- "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8

 include/linux/kgdb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 258cdde8d356..76e891ee9e37 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -365,5 +365,6 @@ extern void kgdb_free_init_mem(void);
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
 static inline void kgdb_free_init_mem(void) { }
+static inline int kgdb_nmicallback(int cpu, void *regs) { return 1; }
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
-- 
2.41.0.rc2.161.g9c6817b8e7-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
