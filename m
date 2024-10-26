Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0E9B2F06
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2Z-0007fB-QZ
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t4iDh-0005Bl-Of
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 14:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JDnu+MIZf7lJLqpqb0qaP8SnzgKLN8VmQVa+gmSmpuE=; b=Drl6Z5r38swqQuZuz5r+3CRf13
 P6pWb1XyRjmnzMZRMtnVp5MbQhMEj28fBMtKP6HJpkovGaw9Xh7qfdSqmuXadNylUtEn3J7TYdAPX
 wFXpYtgRGGa/Ktspdx+3td2dH867y8Tm7UE2qUzURBbpBKQf87+jj3p8lAUoYtk6aRkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JDnu+MIZf7lJLqpqb0qaP8SnzgKLN8VmQVa+gmSmpuE=; b=NTWOj8NdK/vHsCgzHxEoR0EJGX
 Q8iuR0/lMEIb0h83CiImMKlns5B7uCUm7KnbJr4RiSfgk5gTKHtEYcgr+Ej/iqcnXlLKP3Ktf/jzC
 qnZXZ/jpEZHwMmrflUhN9M9DQWt0IC0ICk7dS4qV7qZy37FIZzXn9UKHnI0HeYFvtXSQ=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4iDh-0007mc-P8 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 26 Oct 2024 14:56:50 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 25DC2177103; Sat, 26 Oct 2024 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729954604; bh=dm93p2HTGECj1+ovJm8bfabWgFNTsuuWOau2Y+LDgXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R0zWWKbpQy+LIbfgNXjAlEcfcilL2OV01zfjc46Pdeh/W1/ohNexyZtA7KH6mr8iP
 i+imQmDCbRSe/W9kF1zfb2+pjLLopjQSrVSFCj1erKDvcbsUx7mBGkIYaVKU0vkzeH
 SaMLYzxGn781k3a3TZ9Mi7NKRkAFu5Z6mL5Pw1skbyOdvfJse2hMclvhRN3sMoGGxQ
 eF5b4ajVlOO+f9slBYaSZirB1wYt663VGQ8D9U1eS/IxwBJg17Sof46U0rOYoEB3o8
 dPkLUWrHYF7rsdA/lFCIFpopnaTEtqjtf0GF6El3hKEHT8n2lyT/cEVqRg6dnnBc9j
 5oNQ0yN608L3g==
Date: Sat, 26 Oct 2024 14:56:44 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241026145644.GB892629@lichtman.org>
References: <20241026144724.GA892311@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241026144724.GA892311@lichtman.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yuran Pereira <yuran.pereira@hotmail.com> The function
 simple_strtoul performs no error checking in scenarios where the input value
 overflows the intended output variable. This results in this function
 successfully returning, even when the ou [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1t4iDh-0007mc-P8
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:56 +0000
Subject: [Kgdb-bugreport] [PATCH v3 2/3] trace: kdb: Replace simple_strtoul
 with kstrtoul in kdb_ftdump
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
Cc: daniel.thompson@linaro.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Yuran Pereira <yuran.pereira@hotmail.com>

The function simple_strtoul performs no error checking in scenarios
where the input value overflows the intended output variable.
This results in this function successfully returning, even when the
output does not match the input string (aka the function returns
successfully even when the result is wrong).

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replaces all uses of the simple_strtoul with the safer
alternatives kstrtoint and kstrtol.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
[nir: style fixes]
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/trace/trace_kdb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
index 59857a1ee44c..eadda6e05526 100644
--- a/kernel/trace/trace_kdb.c
+++ b/kernel/trace/trace_kdb.c
@@ -96,23 +96,20 @@ static int kdb_ftdump(int argc, const char **argv)
 {
 	int skip_entries = 0;
 	long cpu_file;
-	char *cp;
+	int err;
 	int cnt;
 	int cpu;
 
 	if (argc > 2)
 		return KDB_ARGCOUNT;
 
-	if (argc) {
-		skip_entries = simple_strtol(argv[1], &cp, 0);
-		if (*cp)
-			skip_entries = 0;
-	}
+	if (argc && kstrtoint(argv[1], 0, &skip_entries))
+		return KDB_BADINT;
 
 	if (argc == 2) {
-		cpu_file = simple_strtol(argv[2], &cp, 0);
-		if (*cp || cpu_file >= NR_CPUS || cpu_file < 0 ||
-		    !cpu_online(cpu_file))
+		err = kstrtol(argv[2], 0, &cpu_file);
+		if (err || cpu_file >= NR_CPUS || cpu_file < 0 ||
+			!cpu_online(cpu_file))
 			return KDB_BADINT;
 	} else {
 		cpu_file = RING_BUFFER_ALL_CPUS;
-- 
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
