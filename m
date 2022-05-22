Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5225530135
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 22 May 2022 08:09:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nsemZ-0002MT-RT
	for lists+kgdb-bugreport@lfdr.de; Sun, 22 May 2022 06:09:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+c9e7f944c22607b8b784+6846+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nsemX-0002MN-Ij
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 May 2022 06:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8vODVBPPT4aieHBVtPQZPwEE8oetsAgiBP0SHP03Ns=; b=gNz6opm/E+NN5Ho4zGsMKIiavf
 SUNk67P4kPw6v0wu/kZQsRqzNsOvkcsDS1cPzg5BfhZZXevhkr4z/DwVCpFYJl3koWK2va7lye2Y3
 iB/YKlwqY4KOJkaCGRUhvA9QENVgCaSoP9TPLW+83GGv5hxkbbU+mco7YrY4xs8dZi04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f8vODVBPPT4aieHBVtPQZPwEE8oetsAgiBP0SHP03Ns=; b=eM1g9PY2NhAHLBehojzb+DHX0F
 Zxx2JWCSxJwlYq1GH2VBo1jsnpQv/HfwXvpT7nX8QzDuQL2KWvSksELi/X0r5jJjzzzm3X4JwK9Tv
 cWzShUVcDvi3B69DSGI+IbSxrmC8u7zUZTpsGr+bLqDKEb6RFgcI47luIf5whPE0McFY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nsemW-0003N3-Dr
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 May 2022 06:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f8vODVBPPT4aieHBVtPQZPwEE8oetsAgiBP0SHP03Ns=; b=dVrwKB+az4x8MRcYyIRObMC3Kz
 0/Lk5RsZ/uHq7rxWTwLfDctoffMnHd/XYI6CywnbwDoBtQ0kGP0IAReMVRjqBcN7i0SOfz0WyQzjA
 72LMGsN8V9ohaRMa+yuZL8XoU9VwEiQiE2PgbZvQra5fAtbw50/0JLdprjgLYkqxfuWFiZ6BP/ylm
 NxxYXDcrYvan5XviHSu6Iu2oEMAP9rTCG164FVGAiNtLsWVSqGCba2HcD3pGV4AYzuLQExeQAeT4l
 L1Dtehj+OTr3rq74yGZS0MDlKvD/f3IME9yzaWi1wHGZN47KQaz/+4mUl1RmIeJIrS4yLTIpAl1X9
 obWQzOxQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nsekq-000fUe-8y; Sun, 22 May 2022 06:07:52 +0000
Date: Sat, 21 May 2022 23:07:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Maninder Singh <maninder1.s@samsung.com>
Message-ID: <YonTOL4zC4CytVrn@infradead.org>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520083701.2610975-1-maninder1.s@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 20, 2022 at 02:06:56PM +0530,
 Maninder Singh wrote:
 > kallsyms functionality depends on KSYM_NAME_LEN directly. > but if user
 passed array length lesser than it, sprintf > can cause issues [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nsemW-0003N3-Dr
Subject: Re: [Kgdb-bugreport] [PATCH 0/5] kallsyms: make kallsym APIs more
 safe with scnprintf
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
Cc: peterz@infradead.org, benh@kernel.crashing.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org,
 onkarnath.1@samsung.com, mpe@ellerman.id.au, anil.s.keshavamurthy@intel.com,
 kartilak@cisco.com, kgdb-bugreport@lists.sourceforge.net,
 naveen.n.rao@linux.ibm.com, longman@redhat.com, borntraeger@linux.ibm.com,
 jejb@linux.ibm.com, mhiramat@kernel.org, v.narang@samsung.com,
 pmladek@suse.com, satishkh@cisco.com, boqun.feng@gmail.com,
 keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com,
 rostedt@goodmis.org, andriy.shevchenko@linux.intel.com, mingo@redhat.com,
 bcain@quicinc.com, martin.petersen@oracle.com, sebaddel@cisco.com,
 senozhatsky@chromium.org, mcgrof@kernel.org, svens@linux.ibm.com,
 jason.wessel@windriver.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> kallsyms functionality depends on KSYM_NAME_LEN directly.
> but if user passed array length lesser than it, sprintf
> can cause issues of buffer overflow attack.
> 
> So changing *sprint* and *lookup* APIs in this patch set
> to have buffer size as an argument and replacing sprintf with
> scnprintf.

This is still a pretty horrible API.  Passing something like
a struct seq_buf seems like the much better API here.  Also with
the amount of arguments and by reference passing it might be worth
to pass them as a structure while you're at it.



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
