Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A149C6F8
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 26 Jan 2022 11:00:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nCf64-0003lT-81
	for lists+kgdb-bugreport@lfdr.de; Wed, 26 Jan 2022 10:00:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+b18af077b488c69bdec9+6728+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nByWM-0001im-NB
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 12:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2gGoEVk8Y/k11EEWsaZZW9coZbG9Md8ydPQy8yxQzo=; b=e0ZuNsJQSXszf6r+riBA/t5TDe
 E/sSwD5nzcCvN5oflsS/w+9ROrwlV047qasP1eVyOkXwNJCW5qM6y7GJ2kZXBnJMO8AsQ24nuaGJm
 phriH81hUa2zMGzGwJD2VYnKQTPW8l1bS4fgvII+GDZwS6NuRnCdnCOln8OiK+uYkj88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z2gGoEVk8Y/k11EEWsaZZW9coZbG9Md8ydPQy8yxQzo=; b=VsYdM44ZxCNHxesCh3KT18s4YV
 EbcSUMvjo0/LTbKBI8i9b1lDwlusif8GjNEiR4AH9uFe36WJbdGTeFaSfl2/ozm+bx9qB+2yZXrYB
 cjWJ1b6ZDWMvqXn2mdTmNrPn3t53cAHCXmRnMiElPUEpl3kF3RpHeq63HoUCp44WJuBU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nByWJ-00APUt-Hx
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 12:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Z2gGoEVk8Y/k11EEWsaZZW9coZbG9Md8ydPQy8yxQzo=; b=Vq9EghPrqQ1SCPzCGV/Usy8QQ1
 irUoY6542/6bq7exJ7BO0wU4Je9ALTjesoyZ27H8Y2HNLj0v3eJCXQDKavRRAGAT2qhyG1ESM3X31
 VAvbvol1wOkEx8sXL6kWjL7aKoUXgofoiexsWaCTGNbYy7Eusseno0T7nUAJi0ef98UO8jXVid3DV
 EhuAg0lTdEgmhTpWnZyey3sZehcKL4b/CxiHim1lq0ThJvVzh8z6mlSJArmJZfC41SKgeeM3z6vI3
 dR3dLQ6be5L6Ypu1BAe1oLeC/yHUXJ4J173D29hFAIoyL8y72O2zHLyihqkMBlqAQjiL3CAI4V+2T
 R7EVJJ4A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nByW4-003Hmi-5y; Mon, 24 Jan 2022 12:32:12 +0000
Date: Mon, 24 Jan 2022 04:32:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <Ye6cTJKTD9JehwnY@infradead.org>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5e58875bd15551d0386552d3f9fa9ee8bc183a2.1643015752.git.christophe.leroy@csgroup.eu>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 24, 2022 at 09:22:15AM +0000, Christophe Leroy
 wrote: > +static inline bool within_range(unsigned long addr, void *base,
 unsigned int size) Please avoid the overly long line. .. But given that this
 function only has a single caller I see no point in factoring it out anyway.
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nByWJ-00APUt-Hx
X-Mailman-Approved-At: Wed, 26 Jan 2022 10:00:09 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 1/7] modules: Refactor
 within_module_core() and within_module_init()
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jan 24, 2022 at 09:22:15AM +0000, Christophe Leroy wrote:
> +static inline bool within_range(unsigned long addr, void *base, unsigned int size)

Please avoid the overly long line.

.. But given that this function only has a single caller I see no
point in factoring it out anyway.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
