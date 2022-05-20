Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3721652EE9A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 20 May 2022 16:59:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ns46Y-00023U-C3
	for lists+kgdb-bugreport@lfdr.de; Fri, 20 May 2022 14:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maninder1.s@samsung.com>) id 1nryAI-0002iQ-Be
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 08:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2237/Ofuxqe67/VYFRa9P3BISgr2hp9724ybcz8E9F4=; b=XsKznOPlmOfUDU2Rc+U1rCdI05
 BPxcD2QleaiG4s2O6pGfjJ7yiI9vMBBsECkTde4Tq4IHPa753vjnNjOlAyTnRKb5QGOvg40rJ9oLN
 6aAjMEB14+mKJHKeSBuYt808lJ9+ytnkx/0aKYLUMOCfP/Eq2Smt2SWELVNv10/q9ybw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2237/Ofuxqe67/VYFRa9P3BISgr2hp9724ybcz8E9F4=; b=Na2kwqGbpXjsZFI2utoMLvFGvj
 wAmrLSXh7q9239A6nxOsit6WnYBd2Vl9IynwKbDXiqIJj67yWinseQgTrYcaWTIRP3mscct7RYzPW
 BV5YuSc37FFWu6FiriU5uSY/jxLtE2417Rc4uyE+QSuHXbjdlXDIZsYLEXyFdskYmQ94=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nryAE-00CG5q-3s
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 May 2022 08:39:18 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220520083904epoutp01d633c5bcdcb6da73271b21c597906494~ww27ZggBF2627726277epoutp01N;
 Fri, 20 May 2022 08:39:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220520083904epoutp01d633c5bcdcb6da73271b21c597906494~ww27ZggBF2627726277epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653035944;
 bh=2237/Ofuxqe67/VYFRa9P3BISgr2hp9724ybcz8E9F4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u8EuLCU4damLDZX89+GSfa5zldk34IKUPwDaK6R19ZlesjN7mpBhJsbdnTTWC3qDM
 fObGoLvRtp1uMLJfVvZnPfccUAhB8mogz6NlgreqwZCLKObcXlegTji+lQFr2s3Flw
 pokB64aAUXpFmH+syf18ARawGRcf2nl2fHB5465I=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20220520083903epcas5p3adf18f19c5ed99372f394308244c18ae~ww26m8o2E0240402404epcas5p3-;
 Fri, 20 May 2022 08:39:03 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.B5.09827.7A357826; Fri, 20 May 2022 17:39:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220520083733epcas5p4ff2414309bf128f40b0bbd3adde52297~ww1nQxUww1594815948epcas5p4M;
 Fri, 20 May 2022 08:37:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220520083733epsmtrp1ebe1d16f82b71ff5466e4767a66bb9a8~ww1nPCU0l0237202372epsmtrp1R;
 Fri, 20 May 2022 08:37:33 +0000 (GMT)
X-AuditID: b6c32a4a-b3bff70000002663-8c-628753a72e5d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.FB.11276.D4357826; Fri, 20 May 2022 17:37:33 +0900 (KST)
Received: from localhost.localdomain (unknown [107.109.224.44]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220520083725epsmtip23ee302e3ef5a51c52121b1c30ddb4167~ww1f26llB3055130551epsmtip2R;
 Fri, 20 May 2022 08:37:25 +0000 (GMT)
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
Date: Fri, 20 May 2022 14:06:58 +0530
Message-Id: <20220520083701.2610975-3-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520083701.2610975-1-maninder1.s@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHd27vo9QUr4jxDHQCGWwwrejEnS0oc/i4sGzBOI1blsyiN8Cg
 wKiKM1lWoPJGkeGAUgoFZ+VVBAtDWpSH8hglrEjkMZhgwcE0Gy9BaZBRLmb+9znfR37nd5LD
 59klUQ78kPDTbFS4OMyFFOA1ze4e2zRHEgI9R7NtUGXHBImUFWUkSovNwpB+/A8cLWa0UGhE
 L8fRZOwFHirTxWDIvNhEIuPTIQopu5aNzmuNJPpdMUegJ6oSgMwtOgwV9tVgqL9UiowpEiSv
 NBHIUN+Oo3/ltSS6X6ckkSx3nkDp6jgeSuld1swKFYks8y8J1NHShqPm/HgcaVpfYqgvfQyg
 Io0b6m4owJBOtjy5NHORQtdTJwlUdreIQq1pDRhaMj8j0O3EYQwZf8kFKGUhByB9ZSGJrlWU
 U6ipPQ8g+aDXxyLGspABmFyZCWcyLZUEoyvux5jCCRnO3FIMUYz89gDF3LzuwRQZJjAm9amc
 YKpKkkhm8IGBZNqyLTiTXtgAGFX7YaYrWw0CHL4SeJ9iw0LOslHb954QBPdoS6nIRNtzurEW
 Qgaq1iQDGz6kd8GbyfFEMhDw7Wg9gL/GGUirYUdPAzh95TzHcwC+aAhNBvyVwvOxA1y+HsB8
 YyvOHWYBjGlMXSmTtAiW1BlwK9vTlSScM35mDfHoIQxqxycpq7Ge3gMLZiswK+O0K6yb1azo
 QnovnDGrKe56W2BO9/wK29A+sO+fQZzLrIPtOaMrzFvOxFXn8qwDIN0ogNXjD1fL+6G+8zHJ
 8Xr4d6tuVXeAE5fiKW6daFid/iPXlQN4R5m5mveBoyY1Yc3waHdYUbedkzfDK79pMW6uLUyz
 jGKcLoS1qlfsCuX9NwiOHeHM1BTOMQOfaLoo7rUyAMxVXabSgZPitX0Ur+2j+H90AeCVgDfZ
 SKkkiJV6Re4MZ6NFUrFEeiY8SHQyQlIFVn6Lh38tGBmeFDUBjA+aAOTzXOyFQCIPtBOeEn9/
 no2K+CbqTBgrbQKOfNxlo5Beigm0o4PEp9lQlo1ko165GN/GQYat86rOcg74y/Z4hmxN/eeN
 j2IHojfkXy4p3lpRKSt2yYKJJaafjfsOT7vi7uhFt7ixp/frXZ1B3qLig0V+P1Qt3TviEVd9
 9Us30eDdkTsuSUmlkqk82VX+znlLX8K9CZXFe9/uT5rhxRMdU0c/6l+QxMouvf1+87c70tam
 2GuLyGPNG3bnDXxa3LnVz+2A8qKNNrDsoP/JY/k9/vH9M3Nbnmn/VLYJ33F22tQVenaTYUlt
 6TUd0hlHHNWz5hrNnhvvPvrJ38k3LHzM09Pki3rTY89hvsdN5Qn233W99fBowFqzR+cX26L1
 bwQ7P3Ae/tAPPNbdCrkveH5o436f8IgLmzvJ8vc+cMGlweIdHrwoqfg/NRNEd5wEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVDTdRzH+/6ewZY/gTt/wiW1K0rUEWXyOc9gfxT+otMUu9OzOhj5u+m5
 IbchKWVNXLJ4MNRdsgeQgYA8Pw9ikxvQTSbzQCGBhC5bBFw7xJQICIiH687/Xp/P+3Wf9z8f
 BvezkYHM8cRkQZUoU4gpX8LaKQ7evvdgesIb091iqOueoMBcU0lBdtpVDGzjDwhYuOyk4aFN
 S8BU2jc4VDaew8Cz0EGB2ztCg7lnObhT0k5Br/FvEv7ML0fgcTZiUDhoxWCoQg3uTCVo6+6S
 YL/pIuCRtoWCvlYzBRrTDAk5lvM4ZA4s7zzGfArmZxZJ6HZ2EdB57QIBpbcWMRjMGUVQVBoC
 9xwFGDRqlpsr9As03MiaIqHyxyIabmU7MFjyTJPQpvsVA3exCUHmnAGBra6QgpKaKho6XHkI
 tMNvSyX8/NxlxJs0dwleP19H8o1lQxhfOKEh+B+MIzSvbfuZ5htuhPJF9gmMz/JqSb6+/FuK
 H75vp/iu3HmCzyl0ID7fdYDvybWg/YFHfHcfFRTHUwRVWGS877H+6go6SffC6cZRJ6lB9esy
 EMNw7A7un9H3MpAP48faENeS9soKc2wQN7v4iFhjf65scYxec/5CXF/7JytMsRKuvNW+7Pgy
 AewIxf2RfpFeGXB2DONqH3bhK5Y/+w5X8LQGW2GCfZVrfVq6eknERnJPPBZ6rSGYM9ybWWUf
 NoobnBwm1toiOafeQq35GziX4ffVPb7sn28y4TmINT4TGZ+JChBWjjYJSWqlXKkOTwpPFD6X
 qGVK9alEueSzk8p6tPpfoVtaUHP5lKQDYQzqQByDiwNESKlN8BMdlZ1JFVQn41SnFIK6AwUx
 hHijqDfDFefHymXJwglBSBJU/6cY4xOowfSZU7+4i2YlTWe7Mr8r2Ox/u8ZQ2VWqq00feJ4c
 ZaVDe56MXLsef0VrqV3ouRL0xYN9ER9UdZ6J+thXLq1akmZtqThscocthOShHOdrd3rtebrN
 ou+bFW9tPWu78GnsNOGwzm1sMDhu4gV4fNDh6B0vx6QOvH4geiziK0t1+6Hcr9v6FCneTc9F
 t71rjY29lBKhN20IqjLL+9dP/rQ9bVwe4B3ZuquJyd5b/+KJnZJiZ8njlOrbBnzykM/SR2X7
 T0ddbYMGRn/ElpravGu2OGSiP3o2wcjHHUw+tzvspXGv7nHVm0ytfNtFxzbzlPTD34LL0J5/
 Y2Ka72dYr8fttL5v/3KdmFAfk4WH4iq17D/cxLrazgMAAA==
X-CMS-MailID: 20220520083733epcas5p4ff2414309bf128f40b0bbd3adde52297
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20220520083733epcas5p4ff2414309bf128f40b0bbd3adde52297
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083733epcas5p4ff2414309bf128f40b0bbd3adde52297@epcas5p4.samsung.com>
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: replace sprintf API with scnprintf which prevents buffer
 overflow.
 Co-developed-by: Onkarnath <onkarnath.1@samsung.com> Signed-off-by: Onkarnath
 <onkarnath.1@samsung.com> Signed-off-by: Maninder Singh
 <maninder1.s@samsung.com>
 --- kernel/kallsyms.c | 13 +++++++------ [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nryAE-00CG5q-3s
X-Mailman-Approved-At: Fri, 20 May 2022 14:59:49 +0000
Subject: [Kgdb-bugreport] [PATCH 2/5] kallsyms: replace sprintf with
 scnprintf
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

replace sprintf API with scnprintf which prevents buffer overflow.

Co-developed-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 kernel/kallsyms.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index f354378e241f..9e4316fe0ba1 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -472,28 +472,29 @@ static int __sprint_symbol(char *buffer, size_t buf_size, unsigned long address,
 	name = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
 				       buffer);
 	if (!name)
-		return sprintf(buffer, "0x%lx", address - symbol_offset);
+		return scnprintf(buffer, buf_size, "0x%lx", address - symbol_offset);
 
 	if (name != buffer)
-		strcpy(buffer, name);
+		strncpy(buffer, name, buf_size);
+
 	len = strlen(buffer);
 	offset -= symbol_offset;
 
 	if (add_offset)
-		len += sprintf(buffer + len, "+%#lx/%#lx", offset, size);
+		len += scnprintf(buffer + len, buf_size - len, "+%#lx/%#lx", offset, size);
 
 	if (modname) {
-		len += sprintf(buffer + len, " [%s", modname);
+		len += scnprintf(buffer + len, buf_size - len, " [%s", modname);
 #if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
 		if (add_buildid && buildid) {
 			/* build ID should match length of sprintf */
 #if IS_ENABLED(CONFIG_MODULES)
 			static_assert(sizeof(typeof_member(struct module, build_id)) == 20);
 #endif
-			len += sprintf(buffer + len, " %20phN", buildid);
+			len += scnprintf(buffer + len, buf_size - len, " %20phN", buildid);
 		}
 #endif
-		len += sprintf(buffer + len, "]");
+		len += scnprintf(buffer + len, buf_size - len, "]");
 	}
 
 	return len;
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
