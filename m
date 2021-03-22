Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD8344CB9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 18:05:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lONze-000429-RJ
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 17:05:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@kernel.org>) id 1lONeF-0003v3-NL
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 16:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=laBHjO3yLbHMb79TFiHRjdoov9dpoDfziDg5JXjN+5I=; b=DFggUWfL5XPtzmalQeo87nqpzs
 x516+gEH7/RIVamU3xpCMVmA9LCQNf/RPaN6gCcCNOsWZ6qOLsDJGq7DwBCSrBcbACuZ+SwtQF3UX
 2vMsaZZ3lujk4/xNSKQC06IGpSpIU1feQf0MlcKsmxMyygzz5kze6bHd/cJ4zbY5JEOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=laBHjO3yLbHMb79TFiHRjdoov9dpoDfziDg5JXjN+5I=; b=E
 HE8SftG9ouSIDwgiTyRdzoB94R4jWhl5zjVTGEMkJl4d4gjPiuTAyY+ze4gCWP8hqbjIYekdOBD78
 lbvG9xhlOwywvO5wWBq0j2IfBgxrtm7A2r338PDKbIN/PkAaZjr7oB5qSt69yreItVFv719DEjJxP
 O9hvF0Gexx6oWAts=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lONeC-0001z5-Ky
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 16:43:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 137706157F;
 Mon, 22 Mar 2021 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616431392;
 bh=XBODrVwui1BLGA9uFZuR76atFHHSxrtpJdBrM3gOevE=;
 h=From:To:Cc:Subject:Date:From;
 b=Yctwy+c7ufuuaKai6RHxr2DdFolb+BulYyvDxs/bKwMftGTbVTYQeWDHiIBqsWaps
 gGmPu+if5ZZniByWFiQV3tkZOGK8q1xj92yGICB9J7GgP/NDJA2iRlt+Cn5sNNmOHn
 N+DtfOBf8FDU2oSX8m6bZq1AOIlRjFA2+8/HaTUrn6ehDLDI+5Sg0LNZ+Ynf5HLjxh
 GqBYu8vXVSDOLxIibSTIh4XGDRKQKlO//wRW4MgsHCEKgx6TzJSLAw78i6LV6reHqf
 qFUDU+vVEodKvqfl7S8qcO1WWOuqBoOf0shrNQ1Dz099exMBL0zAvaB4iF8kQXWa7/
 qeEA84nfHvmLQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@elte.hu>
Date: Mon, 22 Mar 2021 17:43:03 +0100
Message-Id: <20210322164308.827846-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lONeC-0001z5-Ky
X-Mailman-Approved-At: Mon, 22 Mar 2021 17:05:24 +0000
Subject: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
 Christian Brauner <christian.brauner@ubuntu.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCmdjYy0xMSBzdGFydHMgd2Fybmlu
ZyBhYm91dCBtaXNsZWFkaW5nIGluZGVudGF0aW9uIGluc2lkZSBvZiBtYWNyb3M6Cgpkcml2ZXJz
L21pc2Mva2dkYnRzLmM6IEluIGZ1bmN0aW9uIOKAmGtnZGJ0c19icmVha190ZXN04oCZOgpkcml2
ZXJzL21pc2Mva2dkYnRzLmM6MTAzOjk6IGVycm9yOiB0aGlzIOKAmGlm4oCZIGNsYXVzZSBkb2Vz
IG5vdCBndWFyZC4uLiBbLVdlcnJvcj1taXNsZWFkaW5nLWluZGVudGF0aW9uXQogIDEwMyB8ICAg
ICAgICAgaWYgKHZlcmJvc2UgPiAxKSBcCiAgICAgIHwgICAgICAgICBefgpkcml2ZXJzL21pc2Mv
a2dkYnRzLmM6MjAwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJh2MnByaW50a+KA
mQogIDIwMCB8ICAgICAgICAgdjJwcmludGsoImtnZGJ0czogYnJlYWtwb2ludCBjb21wbGV0ZVxu
Iik7CiAgICAgIHwgICAgICAgICBefn5+fn5+fgpkcml2ZXJzL21pc2Mva2dkYnRzLmM6MTA1OjE3
OiBub3RlOiAuLi50aGlzIHN0YXRlbWVudCwgYnV0IHRoZSBsYXR0ZXIgaXMgbWlzbGVhZGluZ2x5
IGluZGVudGVkIGFzIGlmIGl0IHdlcmUgZ3VhcmRlZCBieSB0aGUg4oCYaWbigJkKICAxMDUgfCAg
ICAgICAgICAgICAgICAgdG91Y2hfbm1pX3dhdGNoZG9nKCk7ICAgXAogICAgICB8ICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KClRoZSBjb2RlIGxvb2tzIGNvcnJlY3QgdG8gbWUs
IHNvIGp1c3QgcmVpbmRlbnQgaXQgZm9yIHJlYWRhYmlsaXR5LgoKRml4ZXM6IGU4ZDMxYzIwNGUz
NiAoImtnZGI6IGFkZCBrZ2RiIGludGVybmFsIHRlc3Qgc3VpdGUiKQpTaWduZWQtb2ZmLWJ5OiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGRyaXZlcnMvbWlzYy9rZ2RidHMuYyB8
IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2tnZGJ0
cy5jIGIvZHJpdmVycy9taXNjL2tnZGJ0cy5jCmluZGV4IDk0NTcwMWJjZTU1My4uMmUwODFhNThk
YTZjIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2Mva2dkYnRzLmMKKysrIGIvZHJpdmVycy9taXNj
L2tnZGJ0cy5jCkBAIC05NSwxOSArOTUsMTkgQEAKIAogI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5o
PgogCi0jZGVmaW5lIHYxcHJpbnRrKGEuLi4pIGRvIHsgXAotCWlmICh2ZXJib3NlKSBcCi0JCXBy
aW50ayhLRVJOX0lORk8gYSk7IFwKLQl9IHdoaWxlICgwKQotI2RlZmluZSB2MnByaW50ayhhLi4u
KSBkbyB7IFwKLQlpZiAodmVyYm9zZSA+IDEpIFwKLQkJcHJpbnRrKEtFUk5fSU5GTyBhKTsgXAot
CQl0b3VjaF9ubWlfd2F0Y2hkb2coKTsJXAotCX0gd2hpbGUgKDApCi0jZGVmaW5lIGVwcmludGso
YS4uLikgZG8geyBcCi0JCXByaW50ayhLRVJOX0VSUiBhKTsgXAotCQlXQVJOX09OKDEpOyBcCi0J
fSB3aGlsZSAoMCkKKyNkZWZpbmUgdjFwcmludGsoYS4uLikgZG8gewkJXAorCWlmICh2ZXJib3Nl
KQkJCVwKKwkJcHJpbnRrKEtFUk5fSU5GTyBhKTsJXAorfSB3aGlsZSAoMCkKKyNkZWZpbmUgdjJw
cmludGsoYS4uLikgZG8gewkJXAorCWlmICh2ZXJib3NlID4gMSkJCVwKKwkJcHJpbnRrKEtFUk5f
SU5GTyBhKTsJXAorCXRvdWNoX25taV93YXRjaGRvZygpOwkJXAorfSB3aGlsZSAoMCkKKyNkZWZp
bmUgZXByaW50ayhhLi4uKSBkbyB7CQlcCisJcHJpbnRrKEtFUk5fRVJSIGEpOwkJXAorCVdBUk5f
T04oMSk7CQkJXAorfSB3aGlsZSAoMCkKICNkZWZpbmUgTUFYX0NPTkZJR19MRU4JCTQwCiAKIHN0
YXRpYyBzdHJ1Y3Qga2dkYl9pbyBrZ2RidHNfaW9fb3BzOwotLSAKMi4yOS4yCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1h
aWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
