Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C74592B60
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 15 Aug 2022 12:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1oNX7U-00065I-Cm
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 15 Aug 2022 10:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ira.weiny@intel.com>) id 1oMzBb-00032q-Vc;
 Sat, 13 Aug 2022 22:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=db+1G5s5YET1/p3WZ+miCXoDDQtDBuTM6gOqjL2mgtM=; b=MsWJI0JkwFjo/5JSEKxiOBJgHD
 jzc+Ss8hu+yFVuprkiekT2IHWVzT7A8mWkP/bPymEoPvWFTt7rEzlubl3lXlgDcZly/uQ3NEjdwM9
 eoI4TFCKfIMQBTT3H4l9MH9hcBSFtCOTGIeMNR7g4wvviJrWOBWh/FIlNmwF2dcHuvaw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=db+1G5s5YET1/p3WZ+miCXoDDQtDBuTM6gOqjL2mgtM=; b=g
 NLy6AOWFmualecFEB5Fg7LeREV/u7CaO1Ul/uKQY1VYnV93Z8VgiHGyku6BCiJ86NkLaMpQ0i9OU0
 bORL1V4covs4o9EHECqrx3AIEknZaR6cjxaXTob+rFCISOGqudaSzpXvar/D/Dy8fxQPcTLRGG8JA
 jIMo8vaXi1owrrw4=;
Received: from mga03.intel.com ([134.134.136.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oMzBY-0015Wr-7G; Sat, 13 Aug 2022 22:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660428048; x=1691964048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J2stkkYmPik2bQMds1PPTKQFWYY4K6w3/+pjsawBn4I=;
 b=bgxIXp/xs6uqFfuM6aAWeTAoUIo1/VNWQ6sXhCQ1i4dMlgfFeE9h0qQB
 5zs/rFahDROxg4W15UVWXO0hHmUrz8kHLF9CDRMc6hcafEqXJq1FyK+8m
 p+dXT1NlM83o/3eDKqDGK9MZ+6RLlClAGL2FNEJanAXecp4YmHZ0lC83Q
 QMs+bC97GQslZQouN58C80Ugw1tJEpcbNL42y/xHFOiE00cDvffvMJ2HZ
 VYTRsIPbu+aKBA1HtjsBeIKsJ/jgtdwj4JScBynUXhl2ycUHdS1VMUaZO
 Wg8VYDh3IwNX281LAoscoFBcV5GJCtyKch5RXH5u/h+mQIAv1UZj8e6tl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="293049447"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="293049447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 15:00:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; d="scan'208";a="635047705"
Received: from tsaiyinl-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.209.125.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2022 15:00:40 -0700
From: ira.weiny@intel.com
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2022 15:00:34 -0700
Message-Id: <20220813220034.806698-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Ira Weiny <ira.weiny@intel.com> kmap() and
 kmap_atomic()
 are being deprecated in favor of kmap_local_page(). There are two main
 problems
 with kmap(): (1) It comes with an overhead as mapping space is restricted
 and protected by a global lock for synchronization and (2) it also requires
 global TLB invalidatio [...] 
 Content analysis details:   (-3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.65 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oMzBY-0015Wr-7G
X-Mailman-Approved-At: Mon, 15 Aug 2022 10:14:47 +0000
Subject: [Kgdb-bugreport] [PATCH] checkpatch: Add kmap and kmap_atomic to
 the deprecated list
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
Cc: nvdimm@lists.linux.dev, kvm@vger.kernel.org, linux-sh@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Ira Weiny <ira.weiny@intel.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 linux-csky@vger.kernel.org, iommu@lists.linux.dev,
 linux-snps-arc@lists.infradead.org,
 "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 linux-media@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-block@vger.kernel.org,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-raid@vger.kernel.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKa21hcCgpIGFuZCBrbWFwX2F0
b21pYygpIGFyZSBiZWluZyBkZXByZWNhdGVkIGluIGZhdm9yIG9mCmttYXBfbG9jYWxfcGFnZSgp
LgoKVGhlcmUgYXJlIHR3byBtYWluIHByb2JsZW1zIHdpdGgga21hcCgpOiAoMSkgSXQgY29tZXMg
d2l0aCBhbiBvdmVyaGVhZAphcyBtYXBwaW5nIHNwYWNlIGlzIHJlc3RyaWN0ZWQgYW5kIHByb3Rl
Y3RlZCBieSBhIGdsb2JhbCBsb2NrIGZvcgpzeW5jaHJvbml6YXRpb24gYW5kICgyKSBpdCBhbHNv
IHJlcXVpcmVzIGdsb2JhbCBUTEIgaW52YWxpZGF0aW9uIHdoZW4KdGhlIGttYXDigJlzIHBvb2wg
d3JhcHMgYW5kIGl0IG1pZ2h0IGJsb2NrIHdoZW4gdGhlIG1hcHBpbmcgc3BhY2UgaXMgZnVsbHkK
dXRpbGl6ZWQgdW50aWwgYSBzbG90IGJlY29tZXMgYXZhaWxhYmxlLgoKa21hcF9sb2NhbF9wYWdl
KCkgaXMgc2FmZSBmcm9tIGFueSBjb250ZXh0IGFuZCBpcyB0aGVyZWZvcmUgcmVkdW5kYW50Cndp
dGgga21hcF9hdG9taWMoKSB3aXRoIHRoZSBleGNlcHRpb24gb2YgYW55IHBhZ2VmYXVsdCBvciBw
cmVlbXB0aW9uCmRpc2FibGUgcmVxdWlyZW1lbnRzLiAgSG93ZXZlciwgdXNpbmcga21hcF9hdG9t
aWMoKSBmb3IgdGhlc2Ugc2lkZQplZmZlY3RzIG1ha2VzIHRoZSBjb2RlIGxlc3MgY2xlYXIuICBT
byBhbnkgcmVxdWlyZW1lbnQgZm9yIHBhZ2VmYXVsdCBvcgpwcmVlbXB0aW9uIGRpc2FibGUgc2hv
dWxkIGJlIG1hZGUgZXhwbGljaXRseS4KCldpdGgga21hcF9sb2NhbF9wYWdlKCkgdGhlIG1hcHBp
bmdzIGFyZSBwZXIgdGhyZWFkLCBDUFUgbG9jYWwsIGNhbiB0YWtlCnBhZ2UgZmF1bHRzLCBhbmQg
Y2FuIGJlIGNhbGxlZCBmcm9tIGFueSBjb250ZXh0IChpbmNsdWRpbmcgaW50ZXJydXB0cykuCkl0
IGlzIGZhc3RlciB0aGFuIGttYXAoKSBpbiBrZXJuZWxzIHdpdGggSElHSE1FTSBlbmFibGVkLiBG
dXJ0aGVybW9yZSwKdGhlIHRhc2tzIGNhbiBiZSBwcmVlbXB0ZWQgYW5kLCB3aGVuIHRoZXkgYXJl
IHNjaGVkdWxlZCB0byBydW4gYWdhaW4sCnRoZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzZXMgYXJl
IHJlc3RvcmVkLgoKU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KU3VnZ2VzdGVkLWJ5OiBGYWJpbyBNLiBEZSBGcmFuY2VzY28gPGZtZGVmcmFuY2VzY29A
Z21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+
CgotLS0KU3VnZ2VzdGVkIGJ5IGNyZWRpdHMuCglUaG9tYXM6IElkZWEgdG8ga2VlcCBmcm9tIGdy
b3dpbmcgbW9yZSBrbWFwL2ttYXBfYXRvbWljIGNhbGxzLgoJRmFiaW86IFN0b2xlIHNvbWUgb2Yg
aGlzIGJvaWxlciBwbGF0ZSBjb21taXQgbWVzc2FnZS4KCk5vdGVzIG9uIHRyZWUtd2lkZSBjb252
ZXJzaW9uczoKCkkndmUgY2MnZWQgbWFpbGluZyBsaXN0cyBmb3Igc3Vic3lzdGVtcyB3aGljaCBj
dXJyZW50bHkgY29udGFpbnMgZWl0aGVyIGttYXAoKQpvciBrbWFwX2F0b21pYygpIGNhbGxzLiAg
QXMgc29tZSBvZiB5b3UgYWxyZWFkeSBrbm93IEZhYmlvIGFuZCBJIGhhdmUgYmVlbgp3b3JraW5n
IHRocm91Z2ggY29udmVydGluZyBrbWFwKCkgY2FsbHMgdG8ga21hcF9sb2NhbF9wYWdlKCkuICBC
dXQgdGhlcmUgaXMgYQpsb3QgbW9yZSB3b3JrIHRvIGJlIGRvbmUuICBIZWxwIGZyb20gdGhlIGNv
bW11bml0eSBpcyBhbHdheXMgd2VsY29tZSwKZXNwZWNpYWxseSB3aXRoIGttYXBfYXRvbWljKCkg
Y29udmVyc2lvbnMuICBUbyBrZWVwIGZyb20gc3RlcHBpbmcgb24gZWFjaApvdGhlcnMgdG9lcyBJ
J3ZlIGNyZWF0ZWQgYSBzcHJlYWRzaGVldCBvZiB0aGUgY3VycmVudCBjYWxsc1sxXS4gIFBsZWFz
ZSBsZXQgbWUKb3IgRmFiaW8ga25vdyBpZiB5b3UgcGxhbiBvbiB0YWNraW5nIG9uZSBvZiB0aGUg
Y29udmVyc2lvbnMgc28gd2UgY2FuIG1hcmsgaXQKb2ZmIHRoZSBsaXN0LgoKWzFdIGh0dHBzOi8v
ZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFpX2NrWjEwcDkwYkhfQ2t4RDJiWU5pMDVT
MlF6ODRFMk9GUHY4enFfXzB3L2VkaXQjZ2lkPTE2Nzk3MTQzNTcKCi0tLQogc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbAppbmRl
eCA3OWU3NTlhYWM1NDMuLjlmZjIxOWUwYTlkNSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jaGVja3Bh
dGNoLnBsCisrKyBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbApAQCAtODA3LDYgKzgwNyw4IEBAIG91
ciAlZGVwcmVjYXRlZF9hcGlzID0gKAogCSJyY3VfYmFycmllcl9zY2hlZCIJCQk9PiAicmN1X2Jh
cnJpZXIiLAogCSJnZXRfc3RhdGVfc3luY2hyb25pemVfc2NoZWQiCQk9PiAiZ2V0X3N0YXRlX3N5
bmNocm9uaXplX3JjdSIsCiAJImNvbmRfc3luY2hyb25pemVfc2NoZWQiCQk9PiAiY29uZF9zeW5j
aHJvbml6ZV9yY3UiLAorCSJrbWFwIgkJCQkJPT4gImttYXBfbG9jYWxfcGFnZSIsCisJImttYXBf
YXRvbWljIgkJCQk9PiAia21hcF9sb2NhbF9wYWdlIiwKICk7CiAKICNDcmVhdGUgYSBzZWFyY2gg
cGF0dGVybiBmb3IgYWxsIHRoZXNlIHN0cmluZ3MgdG8gc3BlZWQgdXAgYSBsb29wIGJlbG93Cgpi
YXNlLWNvbW1pdDogNGE5MzUwNTk3YWZmNTBiYmQwZjRiODBjY2Y0OWQyZTAyZDExMTFmNQotLSAK
Mi4zNS4zCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8va2dk
Yi1idWdyZXBvcnQK
