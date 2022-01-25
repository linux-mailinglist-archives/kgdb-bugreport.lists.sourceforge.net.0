Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B27AD49C6FA
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Jan 2022 11:00:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCf64-0003lf-Cg
	for lists+kgdb-bugreport@lfdr.de; Wed, 26 Jan 2022 10:00:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nCTms-0000H9-EN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 21:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtdWMxSaDfBxA1q0kzgQMgUK1HA1XhmJT8E1djQS6r0=; b=k88h2pL8UKFiMOCxYvJZaO3/q
 u2NiwfFLSynnPZGtC9LKW8IUy9EP82Zdx1wRja5l9fu9XfJATjxAy3j/OXUV0lvjRbVi3nPxo+ydd
 vNCOLnVswJWRDejzU71L84AWboShyoIRPwEZwKMbQZgVr9WeIZ3mxtSZAA3e9xtJRexTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UtdWMxSaDfBxA1q0kzgQMgUK1HA1XhmJT8E1djQS6r0=; b=j7J96R002tGg+1jGjAI0yckfQ5
 UUX5VF1bHEmd63Vzm/dfRsJg+tu7DdQi3H3R+Dr7WKw72PWovubdDO2WJWUXp4aAHdoqNibkRNSeu
 armDT26MnLw8uek0wxXSbNJzJgXJZ5aQx5fR+3cezvAxT5IdAW6EpWciZHqrLj3tBupU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCTmp-0008If-Jz
 for kgdb-bugreport@lists.sourceforge.net; Tue, 25 Jan 2022 21:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UtdWMxSaDfBxA1q0kzgQMgUK1HA1XhmJT8E1djQS6r0=; b=HvBznvMJXXQ5wCjccOuoxDI4Xg
 B0ZgQhBeJBmlYaz0y3xOyJWjufMCOjIM51mEjGkrr468wyWeSIOC43+MhGGsLj0jiiBhZv2e4Xdrf
 +q1DgDWnxd2xFJGSszFC7FuHnN9Mxm8KNIboDx6XMtU3qtEuUFEwEB/s4iPlLDNci5nVimutWqHGB
 A0b5yTakxCAwyfm2xzNWv89jmW51ynCxKa90P9QYpZioBsFtxa9XICM/efvmtx9FK/vauxcEYCJRi
 +vp6Euhll5yx1btYLyamKdkUd9M2VV0FZ0KeBgSBM7HtBeJhTozULpcBES/kSQKEzuds+h57qbxof
 BnNEe57g==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nCSnd-009Xxc-Os; Tue, 25 Jan 2022 20:52:21 +0000
Date: Tue, 25 Jan 2022 12:52:21 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <YfBjBRFEbljfbrvx@bombadil.infradead.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1643015752.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 24, 2022 at 09:22:11AM +0000, Christophe Leroy
 wrote: > This series allow architectures to request having modules data in
 > vmalloc area instead of module area. > > This is required on pow [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nCTmp-0008If-Jz
X-Mailman-Approved-At: Wed, 26 Jan 2022 10:00:09 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 0/7] Allocate module text and data
 separately
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 24, 2022 at 09:22:11AM +0000, Christophe Leroy wrote:
> This series allow architectures to request having modules data in
> vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.

Am I understanding that this entire effort is for 32-bit powerpc?
If so, why such an interest in 32-bit these days?

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
