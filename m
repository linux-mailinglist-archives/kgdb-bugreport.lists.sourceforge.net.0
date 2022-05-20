Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8152EE9C
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 May 2022 16:59:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ns46Y-00023y-FJ
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 May 2022 14:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maninder1.s@samsung.com>) id 1nryAQ-0006qs-Ku
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 08:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UsfrS4UvuS4dFM05SqF8Ta7tbBY/QrlkptYTWqQNH+E=; b=aAX9wMQXHye0zn1KTI15K74YsL
 vBwNSNL16ByEZ+fNgTm4+tH9hYENbjhlyN0mucJyhK2jt//IbaX7f80wFnm0vqxZ8NXuZxtpqQmx1
 OBPvnmWawq8VDv+fNH2jqlizckAU7Kw8p/IhTarz995q9SmGSe5te2S4AHb7j099VObA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UsfrS4UvuS4dFM05SqF8Ta7tbBY/QrlkptYTWqQNH+E=; b=BMDbC1wKQRnd/b4mbTeCbbdqvD
 Yv8J7Lls+1VU73M8hMv0e8SNzFPxSQ6exaPvNaMDZjUQA8wh0R2otOjeVA57fq737w0s/v0C7kkXs
 HD29ynvr6Yl+LvVlFsHZYTePit/m5tZ7wrzrdpuD/23FYoyiGbfDfKBJMOY5qPxS6As0=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nryAN-00CG7I-U4
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 08:39:24 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220520083916epoutp023cb1a42d725b95d6d8f1594f01295d96~ww3GiYS5L1883218832epoutp02L;
 Fri, 20 May 2022 08:39:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220520083916epoutp023cb1a42d725b95d6d8f1594f01295d96~ww3GiYS5L1883218832epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653035956;
 bh=UsfrS4UvuS4dFM05SqF8Ta7tbBY/QrlkptYTWqQNH+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aia/QyHkPpm/zR9tj4Cj7Hno19svunmYHyHwsInquziQDKY6IlXghgdpNSmRLJkwO
 rMMgMNRRTwdODovo4wXmgmRKS2FfG2tsdIrmOBUT4Rusv/VF9vkaCQC3zAi4lJgly2
 CJZrPhtTbfKzpzk8glBclSgx019w9KpRKn0+ZccE=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20220520083915epcas5p4ec28bb7c4b401490d717d8b028e47e93~ww3FwITUq1733217332epcas5p44;
 Fri, 20 May 2022 08:39:15 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5B.93.09762.3B357826; Fri, 20 May 2022 17:39:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220520083805epcas5p40642f5a7f9844c61792cd3ac41ac01d3~ww2E389Eb1223812238epcas5p4E;
 Fri, 20 May 2022 08:38:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220520083805epsmtrp14fa161785f4b8b8d2ec9823b3eae2ad9~ww2E2p3KN0239102391epsmtrp1b;
 Fri, 20 May 2022 08:38:05 +0000 (GMT)
X-AuditID: b6c32a4b-1fdff70000002622-65-628753b319ca
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.08.08924.D6357826; Fri, 20 May 2022 17:38:05 +0900 (KST)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220520083757epsmtip233116cea119605d9acfdc1abbb98de9a~ww19d5gaj3055430554epsmtip28;
 Fri, 20 May 2022 08:37:57 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: keescook@chromium.org, pmladek@suse.com, bcain@quicinc.com,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, satishkh@cisco.com,
 sebaddel@cisco.com, kartilak@cisco.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, mcgrof@kernel.org, jason.wessel@windriver.com,
 daniel.thompson@linaro.org, dianders@chromium.org,
 naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 rostedt@goodmis.org, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 akpm@linux-foundation.org, arnd@arndb.de
Date: Fri, 20 May 2022 14:07:01 +0530
Message-Id: <20220520083701.2610975-6-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520083701.2610975-1-maninder1.s@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfUxTVxzNfX0fBVPyBBfvIBsbC05RYc4577IJyzTL0w3nwjYzNwdFX5BI
 kbV2sI/MCgUHiGuQD2lLsZAhFgaUryDfFMdnBxaRgUAEQaHAoMigIgFW+kbmf+f8zvndc89N
 Lp/nnEi58kPDz7PicGGYB+mIVzTt2L67NOBS8BulPRTSd5hJpC4qIFFSdDqGqicGcLSS3Eyh
 kWo5jizRsTxUUHYRQ6MrBhIZp4copO6yCX/mNpLojnKRQFMaHUCjzWUYyu6rwFB/vgQZE0VI
 rjcRqKa2DUez8koS3a1Sk0imshJIoY3hocS/bLNRpYZEy9ZVAnU0t+KoKSsORzdaVjHUp3gE
 UM6Nbai74TqGymS25PyUFQrlXbYQqOB2DoVakhowtDa6QKC6X4YxZPxNBVDiswyAqvXZJMot
 +p1ChrZMgOSD+973ZpafJQNGJTPhTMqynmDKbvZjTLZZhjO3lEMUI6+7TzGleV5MTo0ZYy5P
 ywmmRBdPMoO9NSTTem0ZZxTZDYDRtH3KdF3TgmOuJxzfO82GhX7Hin18gxzPDOU9JiLGPaOm
 RzpxGYh1TwAOfEi/Be8Wl5IJwJHvTFcDqJi08DjyBEDz03qKI/MAli52gI2V9OpOjBOqALTW
 rgKO/ANg/GUFb91F0t5QV1WDr+MttJ6Ei0b/dROPHsJg4YSFWhdc6INwYCbevoDTnnCksNuO
 BbQv1K5qcC7OHWZ0W+1+B9oP9s0M4pxnM2zLGLNjns0TU66yXxzStY5wbGncVolvI4fgROPL
 3DkucLKljOKwKzT/GkdxlkhYrrjArcoBrFenkJzHD46ZtMS6h0fvgEVVPtz4JZjaXohxsU4w
 aXkM4+YCWKnZwJ5Q3l9McNgNzs/N/VeFgU2djTj3WMkAmiavkgrwivK5Osrn6ij/j74OeDrw
 IhshEYWwkn0Re8PZSG+JUCSRhod4nzonKgH2/+L1USV4OGzxNgCMDwwA8nkeWwRAJA92FpwW
 fv8DKz4XKJaGsRIDcOPjHlsF9NrFYGc6RHiePcuyEax4Q8X4Dq4y7M5tn9dFPytNBVHDn3TB
 qMBevfBI1/Fdkq+7s75ofDN2oTygZ2vl4R9Ptn9jPLLywI/EpVfLye3tj9QTA/wpjXXSY6L4
 aeCFPzpmnVJ3BmTHfGbOP/ll5M1Dqlu7Kw86bwu5EuHV66t7OzowxCUt98q8dPaA1XQ0vmTm
 SXvOzIGizHH3o0Pl8dITToJ7cWLfhb87EvZaej4//m3Fx24qg1vAqzXvXprXhavPDgZ+eCp1
 oTXNa080HZWeZk7K72kX7pfOkgmblpaC/EFmkPaBZX9oKlHUdvjhY113fWdMLFp7jR69N/fB
 rvvvuA9vOtYj1XZ+pczaOVUX+oLTTwEi44K/OmdzrQcuOSPc48UTS4T/ApmcuBOeBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxiH/Z+ec3rJGGeF4BksMqto0gHOIdub6JiJW3JiFhnRZAynrMwT
 0NHKWnGic6lYueNYwwK0FbmEi6VO65ChdIyVpbYD5bJFKLSZlZVSIIWYOCKFulK2xG9Pfs+T
 vF9eHkfYS0TzjstOsXKZJFdECvCuflFsgvRgcdab11doMA54SdDdMJBQWViDQc/MJA6ragsX
 XD0qHBYLL3HA0HkBg6lVMwmD804u6IaC4n7rryQMa/4hYK5ej2DK0olB03gXBvYOBQyWS0Fl
 HCHA9LMNhwVVNwl/3NWRoNQuEVDVeJED5WPBbUpTT4J/KUDAgMWKQ//VIhza7gUwGK9yI2hu
 2wajfQ0YdCqDlzuqV7nQXrFIgOG3Zi7cq+zD4PnUUwJ6Sx5hMNiiRVC+XIegx9hEQuuN61ww
 264gUDmS9yYy/mU1YrTKEZyp9hsJpvOaHWOavEqcuaNxchlV7wSX+bFdzDSbvBhTMa8imFv6
 UpJxPDSRjLXWjzNVTX2IqbelMUO1jeij6AzBnmNs7vHTrHxHymeCHGf7NJHniTsz73qAK9Gl
 2DLE59HULrqm5wFWhgQ8IdWN6OWGGXJdxNDPAgv4OkfQ1wIe7nr0BNG6b2uINUFSibT+rglf
 E5GUk6Sniy+HKg7lweibLitnrYqg9tGTvtIQ41Qc7fphNMRhVArdGKj/70QsXTe6xF1jPvUe
 Pe5zhHZhsLFUN5Lr/Su0re7v0M4J9hdvazlViNK8oDQvqAaE6dGrbJ5Cmi1V7Mx7S8Z+laiQ
 SBX5suzEz09Kb6HQi4nF3cikX0w0I4yHzIjmcUSRYUiqyhKGHZMUnGXlJzPl+bmswoxieLho
 Y9hwmS1TSGVLTrFfsGweK//fYjx+tBI7YTQmGeJnde6MidSi0iTVmQGXzukLXw0Pm9k6mbDP
 942sfLfk7a9lfv/RykPuHe5DHanTFbrph0eYp+fTV9Rfnk+98rtNkHM6OS7jWUG/Y/cd/i+F
 aV6zs9k6S+79fv8ndm3xhN7kOMHJlFrISiYeb4lq5be0PUpfeGfTOZ5hxZMp9tcMHNjy6eEN
 +qRsdUTlk4Vau2BMNnw7P6Fkv3nznrqX5g98cLREXdKtvhp12X/zp8dpvr9Syy6oLTHuubMH
 7wtmz/25a+z5+60bVWmvf7jJLrNu8bhFrqjtkckb3hgZSv+uaC78tcMfCzQJj1MiJrcuZhkL
 4t3e5SPvGl/uUsVtFuGKHMlOMUeukPwLrdBORtEDAAA=
X-CMS-MailID: 20220520083805epcas5p40642f5a7f9844c61792cd3ac41ac01d3
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20220520083805epcas5p40642f5a7f9844c61792cd3ac41ac01d3
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083805epcas5p40642f5a7f9844c61792cd3ac41ac01d3@epcas5p4.samsung.com>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: with commit '7878c231dae0 ("slab: remove
 /proc/slab_allocators")'
 lookup_symbol_attrs usage is removed. Thus removing redundant API.
 Signed-off-by:
 Maninder Singh <maninder1.s@samsung.com> --- include/linux/kallsyms.h | 6
 ------ include/linux/module.h | 6 ------ kernel/kallsyms.c | 28
 kernel/module/kall [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nryAN-00CG7I-U4
X-Mailman-Approved-At: Fri, 20 May 2022 14:59:49 +0000
Subject: [Kgdb-bugreport] [PATCH 5/5] kallsyms: remove unsed API
 lookup_symbol_attrs
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
Cc: v.narang@samsung.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, onkarnath.1@samsung.com,
 kgdb-bugreport@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Maninder Singh <maninder1.s@samsung.com>, linuxppc-dev@lists.ozlabs.org,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

with commit '7878c231dae0 ("slab: remove /proc/slab_allocators")'
lookup_symbol_attrs usage is removed.

Thus removing redundant API.

Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 include/linux/kallsyms.h |  6 ------
 include/linux/module.h   |  6 ------
 kernel/kallsyms.c        | 28 ----------------------------
 kernel/module/kallsyms.c | 28 ----------------------------
 4 files changed, 68 deletions(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 8fe535fd848a..b78e9d942a77 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -91,7 +91,6 @@ extern int sprint_backtrace(char *buffer, size_t size, unsigned long address);
 extern int sprint_backtrace_build_id(char *buffer, size_t size, unsigned long address);
 
 int lookup_symbol_name(unsigned long addr, char *symname, size_t size);
-int lookup_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);
 
 /* How and when do we show kallsyms values? */
 extern bool kallsyms_show_value(const struct cred *cred);
@@ -153,11 +152,6 @@ static inline int lookup_symbol_name(unsigned long addr, char *symname, size_t s
 	return -ERANGE;
 }
 
-static inline int lookup_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name)
-{
-	return -ERANGE;
-}
-
 static inline bool kallsyms_show_value(const struct cred *cred)
 {
 	return false;
diff --git a/include/linux/module.h b/include/linux/module.h
index 9b91209d615f..4c5f8f99a252 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -658,7 +658,6 @@ const char *module_address_lookup(unsigned long addr,
 			    char **modname, const unsigned char **modbuildid,
 			    char *namebuf, size_t buf_size);
 int lookup_module_symbol_name(unsigned long addr, char *symname, size_t size);
-int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name);
 
 int register_module_notifier(struct notifier_block *nb);
 int unregister_module_notifier(struct notifier_block *nb);
@@ -766,11 +765,6 @@ static inline int lookup_module_symbol_name(unsigned long addr, char *symname, s
 	return -ERANGE;
 }
 
-static inline int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size, unsigned long *offset, char *modname, char *name)
-{
-	return -ERANGE;
-}
-
 static inline int module_get_kallsym(unsigned int symnum, unsigned long *value,
 					char *type, char *name,
 					char *module_name, int *exported)
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index d6efce28505d..96ad59b5b2fd 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -430,34 +430,6 @@ int lookup_symbol_name(unsigned long addr, char *symname, size_t size)
 	return 0;
 }
 
-int lookup_symbol_attrs(unsigned long addr, unsigned long *size,
-			unsigned long *offset, char *modname, char *name)
-{
-	int res;
-
-	name[0] = '\0';
-	name[KSYM_NAME_LEN - 1] = '\0';
-
-	if (is_ksym_addr(addr)) {
-		unsigned long pos;
-
-		pos = get_symbol_pos(addr, size, offset);
-		/* Grab name */
-		kallsyms_expand_symbol(get_symbol_offset(pos),
-				       name, KSYM_NAME_LEN);
-		modname[0] = '\0';
-		goto found;
-	}
-	/* See if it's in a module. */
-	res = lookup_module_symbol_attrs(addr, size, offset, modname, name);
-	if (res)
-		return res;
-
-found:
-	cleanup_symbol_name(name);
-	return 0;
-}
-
 /* Look up a kernel symbol and return it in a text buffer. */
 static int __sprint_symbol(char *buffer, size_t buf_size, unsigned long address,
 			   int symbol_offset, int add_offset, int add_buildid)
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index c982860405c6..e6f16c62a888 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -375,34 +375,6 @@ int lookup_module_symbol_name(unsigned long addr, char *symname, size_t size)
 	return -ERANGE;
 }
 
-int lookup_module_symbol_attrs(unsigned long addr, unsigned long *size,
-			       unsigned long *offset, char *modname, char *name)
-{
-	struct module *mod;
-
-	preempt_disable();
-	list_for_each_entry_rcu(mod, &modules, list) {
-		if (mod->state == MODULE_STATE_UNFORMED)
-			continue;
-		if (within_module(addr, mod)) {
-			const char *sym;
-
-			sym = find_kallsyms_symbol(mod, addr, size, offset);
-			if (!sym)
-				goto out;
-			if (modname)
-				strscpy(modname, mod->name, MODULE_NAME_LEN);
-			if (name)
-				strscpy(name, sym, KSYM_NAME_LEN);
-			preempt_enable();
-			return 0;
-		}
-	}
-out:
-	preempt_enable();
-	return -ERANGE;
-}
-
 int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 		       char *name, char *module_name, int *exported)
 {
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
