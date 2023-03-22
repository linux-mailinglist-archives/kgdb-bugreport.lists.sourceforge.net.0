Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191D6C69CF
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLG0-0006H8-7k
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@infradead.org>) id 1pf7pC-0001jX-T3
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z950tHfh6EL30Ry68ryUuE9SKuNl3wJnJXXGFZcnt9Q=; b=E1XRDLk+U4IbVQ8C94rQPY81Zw
 QeNUubbPisCzzDW6aMOlSxBx6SZ1F8u3XvWBiBTvuNDw86DwffcctDzMoxtdb1N9R75z9fNEWAJBG
 Z3YQSIquukSQ/d1RpM/FibCBshBcV3ATkdf/vT9S5zHJhn2ZgY3A7y+063mJ+m+NRUSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z950tHfh6EL30Ry68ryUuE9SKuNl3wJnJXXGFZcnt9Q=; b=l7kDjNoj0g9zaxeQG5pJ2SpKd+
 MjzMretjS+6yd/VAMBoj/Ce9tx2gkQ9qMmg4mmnBml6dtkB71sAbuJAPaxs3Nvv0UoCb7ltRxNH0t
 vF+glJagDjg1VeMgFmTHsNnFb21FhVv/7GFea9rh0c9QGgfuA5J4Macp4L6vylpAZOHM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pf7pD-00H62J-6C for kgdb-bugreport@lists.sourceforge.net;
 Wed, 22 Mar 2023 23:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=z950tHfh6EL30Ry68ryUuE9SKuNl3wJnJXXGFZcnt9Q=; b=UFtsNZLqrpJZnIPJsNmouu7sPP
 BHHKxTqGFj2St8yKQFa9kHJDTZN+YbsXupvmBWsR4HFCDADBO4/6O8hi8MtnhIpSscbw53dGBsX15
 iPGRkwMr1f8UOY8di2PEqvcW2M+HsLcd8TfLjtRZ8etVPLRdYjd7/i+9WAKfUEmvqwdkS/no4BEzH
 f3FMNvfwfTMvIgOyNqxO6nLzZ4TTG1G9kVE1zsw7ac7V3nVry62uI9xZ4sV+eVmjeb3ufzSx344sl
 aRjMjSY1UsMjcIg/vV+fihRMFAWSNn92m2ekPWsnUZZNh6VqCO7F5h3Ir/9QbvuMHfjAqnmhSPKf1
 wINWkjAw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1pf7ot-0007fT-26; Wed, 22 Mar 2023 23:24:39 +0000
From: Luis Chamberlain <mcgrof@bombadil.infradead.org>
To: jason.wessel@windriver.com, joe.lawrence@redhat.com,
 daniel.thompson@linaro.org, jikos@kernel.org,
 linux-modules@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org,
 trix@redhat.com, chris@chrisdown.name, linux-kernel@vger.kernel.org,
 mbenes@suse.cz, terrelln@fb.com, kgdb-bugreport@lists.sourceforge.net,
 live-patching@vger.kernel.org, fmdefrancesco@gmail.com,
 dianders@chromium.org, pmladek@suse.com, jpoimboe@kernel.org,
 ndesaulniers@google.com, bpf@vger.kernel.org
Date: Wed, 22 Mar 2023 16:24:33 -0700
Message-Id: <167952705567.2263470.18228933182686895553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315125256.22772-1-fmdefrancesco@gmail.com>
References: <20230315125256.22772-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Luis Chamberlain <mcgrof@kernel.org> On Wed, 15 Mar
 2023 13:52:56 +0100, Fabio M. De Francesco wrote: > Use kunmap_local() to
 unmap pages locally mapped with kmap_local_page(). > > kunmap_local() must
 be called on the kernel virtual addr [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pf7pD-00H62J-6C
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:22 +0000
Subject: Re: [Kgdb-bugreport] [PATCH] module/decompress: Never use kunmap()
 for local un-mappings
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, dmitry.torokhov@gmail.com,
 ira.weiny@intel.com, piotrgorski@cachyos.org, swboyd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Luis Chamberlain <mcgrof@kernel.org>

On Wed, 15 Mar 2023 13:52:56 +0100, Fabio M. De Francesco wrote:
> Use kunmap_local() to unmap pages locally mapped with kmap_local_page().
> 
> kunmap_local() must be called on the kernel virtual address returned by
> kmap_local_page(), differently from how we use kunmap() which instead
> expects the mapped page as its argument.
> 
> In module_zstd_decompress() we currently map with kmap_local_page() and
> unmap with kunmap(). This breaks the code and so it should be fixed.
> 
> [...]

Applied, thanks!

[1/1] module/decompress: Never use kunmap() for local un-mappings
      commit: 3c17655ab13704582fe25e8ea3200a9b2f8bf20a

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
