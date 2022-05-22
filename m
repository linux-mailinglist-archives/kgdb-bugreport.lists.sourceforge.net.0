Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A653023F
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 22 May 2022 11:58:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nsiMU-0005CN-Mp
	for lists+kgdb-bugreport@lfdr.de; Sun, 22 May 2022 09:58:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nsiMT-0005CD-Cf
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 May 2022 09:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZPV27bKY7IltA4PFgvW1/4Anvkq8AYMt9jsXjELcgNY=; b=dG/0XZXHpQxHv68nGeX+XibHOs
 E+C5HMwZAwXDCw2gOROY4rNnYbd9CU22Vc0YXQLf9Bwr9I1j6iNu8dz4gL15gX19DMZHswnwH8A4d
 HLzJPzeC5mIt8Bm5CNipQsBPBIr9bSR6OkGx2hw9CcGcL2DIp0iavyNlLcxeSa/NCgFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZPV27bKY7IltA4PFgvW1/4Anvkq8AYMt9jsXjELcgNY=; b=k85RCFENlBlO3n95g8MCLAX+8E
 NXwM8hKd2VPMW5DO879GfI55dQZQ77i8KegK3ZZXvXl4wR+vjYcfYYYojhNBGrbgv6oSAzvrhH8fv
 Xby762PV3xHXDCuZWl0+qYQnspgIZieFUtr4RhFMCBZfnXiVY3nfIiLQj+8SyCvAMirc=;
Received: from mga09.intel.com ([134.134.136.24])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nsiMN-000O8H-KC
 for kgdb-bugreport@lists.sourceforge.net; Sun, 22 May 2022 09:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653213531; x=1684749531;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J1uRxreTk2vcgBP+Mv+o2kjbzDSrcYl4+WqXF1IBsU8=;
 b=noZK5mASHIH+vjL/gHHxq6VcswDS5OxsHWrGAvxJ2Duzo+vzedbj0ZmV
 8++dxq/734kmrm7zr8V1jTtaJX0MfUWao27BItecaIqO+l1O6YfXajefF
 awOZ2L5xlvqpauurIUv71HK4+0gWmJjz+DKfU2KHeGdK1etfj3RwsDmDI
 7hOrcRXjReoXj6fO2aL4y5eGqsf5L7ehIa2c56WcT0cTCl1Caa1uk6Ptt
 UWQOmLALEV5T7VcQRBhHLaGGrNx1hdMel9UwJAu2UlofnNQYqr6REBJN3
 BxViX3l6va+adHS2PFPl/qfBqK+9zOsUY7e+KSArkigMzTnsjaxC4s2Zq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="272683854"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="272683854"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 02:43:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="571562866"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 02:43:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nsi73-000IR6-9y; Sun, 22 May 2022 12:43:01 +0300
Date: Sun, 22 May 2022 12:43:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Message-ID: <YooFpVGuDoyfoQPS@smile.fi.intel.com>
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083725epcas5p1c3e2989c991e50603a40c81ccc4982e0@epcas5p1.samsung.com>
 <20220520083701.2610975-2-maninder1.s@samsung.com>
 <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, May 20, 2022 at 03:52:01PM -0400, Waiman Long wrote:
    > On 5/20/22 04:36, Maninder Singh wrote: ... > > - sprint_symbol(sym, addr);
    > > + sprint_symbol(sym, KSYM_SYMBOL_LEN, addr); > > Instead of hardcoding
    KSYM_SYMBOL_LEN everywhere, will it better to hide it > like this: > >        
    extern int __s [...] 
 
 Content analysis details:   (-3.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [134.134.136.24 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [134.134.136.24 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nsiMN-000O8H-KC
Subject: Re: [Kgdb-bugreport] [PATCH 1/5] kallsyms: pass buffer size in
 sprint_* APIs
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
 naveen.n.rao@linux.ibm.com, borntraeger@linux.ibm.com, jejb@linux.ibm.com,
 mhiramat@kernel.org, v.narang@samsung.com, pmladek@suse.com,
 satishkh@cisco.com, boqun.feng@gmail.com, keescook@chromium.org,
 gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org,
 linux-fsdevel@vger.kernel.org, mingo@redhat.com, bcain@quicinc.com,
 martin.petersen@oracle.com, sebaddel@cisco.com, senozhatsky@chromium.org,
 mcgrof@kernel.org, svens@linux.ibm.com, jason.wessel@windriver.com,
 Maninder Singh <maninder1.s@samsung.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, May 20, 2022 at 03:52:01PM -0400, Waiman Long wrote:
> On 5/20/22 04:36, Maninder Singh wrote:

...

> > -		sprint_symbol(sym, addr);
> > +		sprint_symbol(sym, KSYM_SYMBOL_LEN, addr);
> =

> Instead of hardcoding KSYM_SYMBOL_LEN everywhere, will it better to hide =
it
> like this:
> =

> =A0=A0=A0=A0=A0=A0=A0 extern int __sprint_symbol(char *buffer, size_t siz=
e, unsigned long
> address);
> =A0=A0=A0=A0=A0=A0=A0 #define sprint_symbol(buf, addr)=A0=A0=A0=A0=A0=A0=
=A0 __sprint_symbol(buf,
> sizeof(buf), addr)
> =

> Or you can use sizeof(buf) directly instead of KSYM_SYMBOL_LEN.

This assumes that buf is defined as char [], which might be not always the
case. If you are going with the macro, than ARRAY_SIZE() seems appropriate
to perform a check against the above mentioned constraint.


-- =

With Best Regards,
Andy Shevchenko




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
