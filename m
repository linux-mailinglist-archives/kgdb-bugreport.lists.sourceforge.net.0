Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B00519E7D0B
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  7 Dec 2024 00:57:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tJiCm-0003hG-HB
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 06 Dec 2024 23:57:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1tJiCl-0003h2-0u
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 23:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6CVT3fCHjW+EtyEf2snrM4FnEMzCe5lxg9d7lhPV0Rg=; b=OXI5eS2d/teMEY/6/t/XQDqhO8
 Kghfy7iLkdkf5QMEtL+N3r6AbmK+jGvxSH4+FbDeXKMi83DE9a+pnt+T7hNj1D83GQjs23w01usYL
 qgLOAwfSSvHffbfrwCxZcB2WpG7YcshL6y4WZ2xruQYt+jJEq8vgaJ3JGpD4WMcDinhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6CVT3fCHjW+EtyEf2snrM4FnEMzCe5lxg9d7lhPV0Rg=; b=CXESo3nWQWpwjgDGNMthZA4Im/
 rjscoxKzDrSntqTZ49Rww6kFY6ZLaxut9pDgbWcEYX+GRsw3KM8r/lZ4YnjlpwYcwNCssQnJL2Bn2
 CJgJER6qUjFSgJD8yZcelPxmV0NYjJ4WtboU6DXG8RSp9kjy1/2XCbLScaj7LXJkIJ2w=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJiCi-0002tM-Qi for kgdb-bugreport@lists.sourceforge.net;
 Fri, 06 Dec 2024 23:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=6CVT3fCHjW+EtyEf2snrM4FnEMzCe5lxg9d7lhPV0Rg=; b=J2qxaBQwDrpKlVwIU9ymGvxU35
 5YDgdNS+IoQkxYyvLoGdRs32vmsDUHm/A9bEE8GlhhVwHG/003I9lVcSYDc6trCJdokqP1QBoDBUX
 O9iRHaXf9gRLslH0f94zcVHKl6fTubWkK4dRB3+3ZRH8S8SuekAneHbN1ZFgdVqUHx+O03AuGffl8
 pgVnkyTy46ZSe6ddkV5snAuEi0BbfZLnJRc2GkqR+czqBTvCNWhb3tpFsKnI5jnQ4ywcq3Rh3LAP6
 qRsSaEa70wLlLoq/FMVrrJnwuNBeePaPtQCug4hZpN0Egl66tj8VLKq5A0cWu+1jQGkYgKVURKyBC
 B9MtveZA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1tJiCR-0000000FAy7-0nVv; Fri, 06 Dec 2024 23:57:33 +0000
Message-ID: <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
Date: Fri, 6 Dec 2024 15:57:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <87h67gu5q1.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87h67gu5q1.fsf@trenco.lwn.net>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/6/24 8:38 AM, Jonathan Corbet wrote: > Randy Dunlap
 <rdunlap@infradead.org> writes: > >> Move gdb and kgdb debugging documentation
 to the dedicated >> debugging directory (Documentation/process/ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tJiCi-0002tM-Qi
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: move dev-tools
 debugging files to process/debugging/
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
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 kgdb-bugreport@lists.sourceforge.net, Daniel Thompson <danielt@kernel.org>,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net



On 12/6/24 8:38 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Move gdb and kgdb debugging documentation to the dedicated
>> debugging directory (Documentation/process/debugging/).
>> Adjust the index.rst files to follow the file movement.
>> Update location of kgdb.rst in MAINTAINERS file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> 
> So ... since these are indeed development tools, I wonder if we should
> leave a reference behind in case people are looking for them there?

As far as I'm concerned, all debug tools are development tools, so I'm back
to all of /process/debugging/ should be somewhere else.  ;)

cheers.
-- 
~Randy



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
