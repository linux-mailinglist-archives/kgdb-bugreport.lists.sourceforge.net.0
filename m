Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE056C4BF
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Jul 2022 02:10:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1o9y33-000383-NB
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Jul 2022 00:10:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1o9y32-00037w-8t
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Jul 2022 00:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W2LVGWnAwFgRc5jhP8FcZl76hymzaguoUc9mEpMyzqk=; b=E+KUkfGat711SpwXunpMHQQAHv
 tJ/Zjxr4X1dfG79/9OTDlBm1UtCMziEgQFX/Gvxtr34AXGWdXdYuK7seRL3MtH2kRIg7XWO4+k2tL
 XoQyWh+c7ErB7DWXMUZR4rBFKsDNNprAgCO9STx5jB52UlOnEtXnH7SQE6hlccbn4rWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W2LVGWnAwFgRc5jhP8FcZl76hymzaguoUc9mEpMyzqk=; b=e
 cZ0jprPCU/OzEXH4VA6gvzICndtr+6hzCuy6yHkbWYX3BSru0VCUoULBkOLPqfvrhBdTKXyJlBIMr
 v5VcF4JCV4tsqO+gxlqo2P+Y9dQFrIpd4f8ONuaQen2pZCCa1vZDptSTd7P6oYqTuJDyPtXHff3pd
 tT+/uoplC/hqezMk=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o9y2z-00057A-70
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Jul 2022 00:10:11 +0000
Received: by mail-pj1-f48.google.com with SMTP id p9so364379pjd.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Jul 2022 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2LVGWnAwFgRc5jhP8FcZl76hymzaguoUc9mEpMyzqk=;
 b=kkOW1+SjtZPxCBn2fz4/jmiOkOnCyX9VUWF7EydqhDfwApPAEJ1e0HoFrJSSEi+srl
 rEnEpC6C2YRQHRllsFcMf+aifrQTAuBM0clcSljbNteeWl3yotxWdY2DNqP9zePwIk9j
 +djYKBSpvjUYQlYH6CUWGEiQ0rGy5OdgHlJps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W2LVGWnAwFgRc5jhP8FcZl76hymzaguoUc9mEpMyzqk=;
 b=fuRbzymnv8Yj+Hx65y/XSupRhj7qwHe8fJFCgz3CshtAWyGVo+QClTG/uBjVMKaean
 kEvrKAU56xCliuZeMtK9wHkGikB9tQwIpM1CinD6oQAcm21k+GzMLQIINPrp3TnMHoog
 fWqzLxvZWYw9vYHMzAdOT8dj5Uvhbzgp2A2AkBJfPbK3WrP7ldmLZy1Chq71OuYLe1b5
 4woLb4CxCu39xnmbgIZPpGfTEZCV3znbfWydZfinCy13Uj2+CjRhLjwNJbYb29PfFCUX
 Zd1nt95OE2THvdlc+rPnEteHkbTqkHAT3b2iG/MlWeBtu5xZP8/A5S9846AVj6CAKS8i
 dWRw==
X-Gm-Message-State: AJIora/GtEcmCaTGhZUMe9/pZmHyl7Ruazdq3oFusl2oF0rFSG8U1iII
 aotqcF/s5bCQQfbWVFmdHJyN8Q==
X-Google-Smtp-Source: AGRyM1uULmuZRaaRkYAYsmExtrJbPm//wpABlQ5XATc+h5LLDlbZ5cyuD1LMFeHvOA+LFBe5geqHyQ==
X-Received: by 2002:a17:903:2112:b0:16b:de4d:555a with SMTP id
 o18-20020a170903211200b0016bde4d555amr6242641ple.61.1657325403592; 
 Fri, 08 Jul 2022 17:10:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f16f:292f:711d:4603])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b0016bd6635b6csm82695pln.278.2022.07.08.17.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 17:10:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Date: Fri,  8 Jul 2022 17:09:52 -0700
Message-Id: <20220708170919.1.I75844e5038d9425add2ad853a608cb44bb39df40@changeid>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If you drop into kdb and type "ftdump" you'll get a sleeping
 while atomic warning from memory allocation in trace_find_next_entry(). This
 appears to have been caused by commit ff895103a84a ("tracing: Save off entry
 when peeking at next entry"), which added the allocation in that path. The
 problematic commit was already fixed by com [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o9y2z-00057A-70
Subject: [Kgdb-bugreport] [PATCH] tracing: Fix sleeping while atomic in kdb
 ftdump
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If you drop into kdb and type "ftdump" you'll get a sleeping while
atomic warning from memory allocation in trace_find_next_entry().

This appears to have been caused by commit ff895103a84a ("tracing:
Save off entry when peeking at next entry"), which added the
allocation in that path. The problematic commit was already fixed by
commit 8e99cf91b99b ("tracing: Do not allocate buffer in
trace_find_next_entry() in atomic") but that fix missed the kdb case.

The fix here is easy: just move the assignment of the static buffer to
the place where it should have been to begin with:
trace_init_global_iter(). That function is called in two places, once
is right before the assignment of the static buffer added by the
previous fix and once is in kdb.

Note that it appears that there's a second static buffer that we need
to assign that was added in commit efbbdaa22bb7 ("tracing: Show real
address for trace event arguments"), so we'll move that too.

Fixes: ff895103a84a ("tracing: Save off entry when peeking at next entry")
Fixes: efbbdaa22bb7 ("tracing: Show real address for trace event arguments")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/trace/trace.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 2c95992e2c71..64700ad2866b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9866,6 +9866,12 @@ void trace_init_global_iter(struct trace_iterator *iter)
 	/* Output in nanoseconds only if we are using a clock in nanoseconds. */
 	if (trace_clocks[iter->tr->clock_id].in_ns)
 		iter->iter_flags |= TRACE_FILE_TIME_IN_NS;
+
+	/* Can not use kmalloc for iter.temp and iter.fmt */
+	iter->temp = static_temp_buf;
+	iter->temp_size = STATIC_TEMP_BUF_SIZE;
+	iter->fmt = static_fmt_buf;
+	iter->fmt_size = STATIC_FMT_BUF_SIZE;
 }
 
 void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
@@ -9898,11 +9904,6 @@ void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
 
 	/* Simulate the iterator */
 	trace_init_global_iter(&iter);
-	/* Can not use kmalloc for iter.temp and iter.fmt */
-	iter.temp = static_temp_buf;
-	iter.temp_size = STATIC_TEMP_BUF_SIZE;
-	iter.fmt = static_fmt_buf;
-	iter.fmt_size = STATIC_FMT_BUF_SIZE;
 
 	for_each_tracing_cpu(cpu) {
 		atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->disabled);
-- 
2.37.0.rc0.161.g10f37bed90-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
