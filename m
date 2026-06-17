Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L6veGsx6MmpZ0gUAu9opvQ
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 12:45:32 +0200
X-Original-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B75698A08
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 Jun 2026 12:45:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=CuejnRbT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Vvs16F8t;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=lqbcDeAb;
	dkim=fail ("body hash did not verify") header.d=intel.com header.s=Intel header.b=UrCyZ7ZS;
	spf=pass (mail.lfdr.de: domain of kgdb-bugreport-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=kgdb-bugreport-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=intel.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6YKlo3CzgS6N68ZSZZXLDU64DgRXplNYkm/idJ+tyM=; b=CuejnRbTOdT86zP8tQ8JE/nq6o
	PO4tp3I+f/uLt6rTdBYiAC+aFRuzNV8YGftB24ucsmAWsLfVWP0i5dRp2BLKToAo3U117XuK5SK6G
	rlM4EyxxYFGMvEa1IHrl9Pw2VI9DtUDHXsQn/KA3+aOhFCwamw5XpfXmhmy5dNJhX2ks=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1wZnlx-0007s9-Lo
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 Jun 2026 10:45:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1wZnla-0007qW-HF
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 10:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Y6eE2C+KOcwqbRuOf5ctSpDKYLGZQCokZoGps74USo=; b=Vvs16F8tjeBq4+zMivr3A3IRrq
 UwjQUNtarrTVwZ0PpRMV8ro7jW+cdDvFVmkSyeQL3cmchdDNMwxMbhQ2Ars7chLQSvUUgLBWn6agv
 rC1jIaOuAFTE1cd8lFnDYU2FgAuhYkR7ngpnVESE+sRPShmE2c+7Vzc+CCxJfSr63iQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2Y6eE2C+KOcwqbRuOf5ctSpDKYLGZQCokZoGps74USo=; b=lqbcDeAbpB+jBczf5MtxUfCDSj
 QjfGzcRK75vb7CfPdv5vRkl+SYs9aw/f+SRS1RQBl60v/Vpcr4Da4eIHaGgBM353X5ibgPTnxR7Ly
 WsQya8jWI/14E0xXVkqMg8+jYjE6J6NHQBzceHYfJyE90KA3GKMDjZ5sVTPnKoZ6sS7E=;
Received: from mgamail.intel.com ([192.198.163.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZnlY-00083D-2H for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 Jun 2026 10:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693105; x=1813229105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Uc8BT+mzTT/ICA76kiYpcB2XPxl7G5SqO34S/a8NR4Q=;
 b=UrCyZ7ZSHzPGLAf/H6pcLkDRU0sYjZxRDC6UevEgFP9wdT0ILhZ99wFu
 hT/DcGe6OK5JFzDwsnXTUUdeXQyOShc5k09mFf+fDa1iiln8ywhEd7lD1
 kXgNKrOyqX341pbl6R6u3dDAkqPzyrWcqrFT1vnIppUUAGQxMm4Jd6Nha
 n9YKWBLqH7QIYhntz7wXnCjY6e9iwUhT3OyOsZyULlazk3FTuc7XawMtd
 nR8JTEX8EOgHIPPHmUC6J/3cuhiPrtpBEXcqTEjBwrbSKJ4/TTnuekoa+
 NldAwBciWGvo/3A4hZVFdOZRt42ea/+MkFXSFa4oUgbz0cUuffvJY1DBs A==;
X-CSE-ConnectionGUID: Uyo1j357RQSpBrPoRy7h6Q==
X-CSE-MsgGUID: MtWI8kkdRdKylGhhQ8Hjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="70014360"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="70014360"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:44:54 -0700
X-CSE-ConnectionGUID: oggmQ/chTC+mxk43D59z+g==
X-CSE-MsgGUID: ZqZhAN1MRKCdu/D6bVIsmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="241672169"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2026 03:44:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wZnlI-00000000UNu-3pyb;
 Wed, 17 Jun 2026 10:44:48 +0000
Date: Wed, 17 Jun 2026 18:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
 jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org
Message-ID: <202606171818.9AqxpkQ1-lkp@intel.com>
References: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx@kuyf2f2lvett>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Naveen,
 kernel test robot noticed the following build errors:
 [auto build test ERROR on v7.1] [also build test ERROR on linus/master
 next-20260616]
 [If your patch is applied to the wrong git tree, kindly drop us a note. And
 when submitting patch, we suggest to u [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [192.198.163.16 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wZnlY-00083D-2H
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: use sizeof(kdb_prompt_str)
 instead of mismatched CMD_BUFLEN
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
Cc: kgdb-bugreport@lists.sourceforge.net, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:naveen.osdev@gmail.com,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:kgdb-bugreport@lists.sourceforge.net,m:llvm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:naveenosdev@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,windriver.com,kernel.org,chromium.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,kgdb-bugreport-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,intel.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,kgdb-bugreport-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,intel.com:s=Intel];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[kgdb-bugreport];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:mid,intel.com:from_mime,git-scm.com:url,01.org:url,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85B75698A08

Hi Naveen,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.1]
[also build test ERROR on linus/master next-20260616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-Kumar-Chaudhary/kdb-use-sizeof-kdb_prompt_str-instead-of-mismatched-CMD_BUFLEN/20260617-055312
base:   v7.1
patch link:    https://lore.kernel.org/r/uqjlxgcu6y6ukayda7jka7ji73ctkj4f3632rejud6cqqayfwx%40kuyf2f2lvett
patch subject: [PATCH] kdb: use sizeof(kdb_prompt_str) instead of mismatched CMD_BUFLEN
config: hexagon-randconfig-001-20260617 (https://download.01.org/0day-ci/archive/20260617/202606171818.9AqxpkQ1-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171818.9AqxpkQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171818.9AqxpkQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_main.c:1268:34: error: invalid application of 'sizeof' to an incomplete type 'char[]'
    1268 |                 snprintf(kdb_prompt_str, sizeof(kdb_prompt_str),
         |                                                ^~~~~~~~~~~~~~~~
   1 error generated.


vim +1268 kernel/debug/kdb/kdb_main.c

  1124	
  1125	/*
  1126	 * kdb_local - The main code for kdb.  This routine is invoked on a
  1127	 *	specific processor, it is not global.  The main kdb() routine
  1128	 *	ensures that only one processor at a time is in this routine.
  1129	 *	This code is called with the real reason code on the first
  1130	 *	entry to a kdb session, thereafter it is called with reason
  1131	 *	SWITCH, even if the user goes back to the original cpu.
  1132	 * Inputs:
  1133	 *	reason		The reason KDB was invoked
  1134	 *	error		The hardware-defined error code
  1135	 *	regs		The exception frame at time of fault/breakpoint.
  1136	 *	db_result	Result code from the break or debug point.
  1137	 * Returns:
  1138	 *	0	KDB was invoked for an event which it wasn't responsible
  1139	 *	1	KDB handled the event for which it was invoked.
  1140	 *	KDB_CMD_GO	User typed 'go'.
  1141	 *	KDB_CMD_CPU	User switched to another cpu.
  1142	 *	KDB_CMD_SS	Single step.
  1143	 */
  1144	static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
  1145			     kdb_dbtrap_t db_result)
  1146	{
  1147		char *cmdbuf;
  1148		int diag;
  1149		struct task_struct *kdb_current =
  1150			curr_task(raw_smp_processor_id());
  1151	
  1152		KDB_DEBUG_STATE("kdb_local 1", reason);
  1153	
  1154		kdb_check_for_lockdown();
  1155	
  1156		kdb_go_count = 0;
  1157		if (reason == KDB_REASON_DEBUG) {
  1158			/* special case below */
  1159		} else {
  1160			kdb_printf("\nEntering kdb (current=0x%px, pid %d) ",
  1161				   kdb_current, kdb_current ? kdb_current->pid : 0);
  1162	#if defined(CONFIG_SMP)
  1163			kdb_printf("on processor %d ", raw_smp_processor_id());
  1164	#endif
  1165		}
  1166	
  1167		switch (reason) {
  1168		case KDB_REASON_DEBUG:
  1169		{
  1170			/*
  1171			 * If re-entering kdb after a single step
  1172			 * command, don't print the message.
  1173			 */
  1174			switch (db_result) {
  1175			case KDB_DB_BPT:
  1176				kdb_printf("\nEntering kdb (0x%px, pid %d) ",
  1177					   kdb_current, kdb_current->pid);
  1178	#if defined(CONFIG_SMP)
  1179				kdb_printf("on processor %d ", raw_smp_processor_id());
  1180	#endif
  1181				kdb_printf("due to Debug @ " kdb_machreg_fmt "\n",
  1182					   instruction_pointer(regs));
  1183				break;
  1184			case KDB_DB_SS:
  1185				break;
  1186			case KDB_DB_SSBPT:
  1187				KDB_DEBUG_STATE("kdb_local 4", reason);
  1188				return 1;	/* kdba_db_trap did the work */
  1189			default:
  1190				kdb_printf("kdb: Bad result from kdba_db_trap: %d\n",
  1191					   db_result);
  1192				break;
  1193			}
  1194	
  1195		}
  1196			break;
  1197		case KDB_REASON_ENTER:
  1198			if (KDB_STATE(KEYBOARD))
  1199				kdb_printf("due to Keyboard Entry\n");
  1200			else
  1201				kdb_printf("due to KDB_ENTER()\n");
  1202			break;
  1203		case KDB_REASON_KEYBOARD:
  1204			KDB_STATE_SET(KEYBOARD);
  1205			kdb_printf("due to Keyboard Entry\n");
  1206			break;
  1207		case KDB_REASON_ENTER_SLAVE:
  1208			/* drop through, slaves only get released via cpu switch */
  1209		case KDB_REASON_SWITCH:
  1210			kdb_printf("due to cpu switch\n");
  1211			break;
  1212		case KDB_REASON_OOPS:
  1213			kdb_printf("Oops: %s\n", kdb_diemsg);
  1214			kdb_printf("due to oops @ " kdb_machreg_fmt "\n",
  1215				   instruction_pointer(regs));
  1216			kdb_dumpregs(regs);
  1217			break;
  1218		case KDB_REASON_SYSTEM_NMI:
  1219			kdb_printf("due to System NonMaskable Interrupt\n");
  1220			break;
  1221		case KDB_REASON_NMI:
  1222			kdb_printf("due to NonMaskable Interrupt @ "
  1223				   kdb_machreg_fmt "\n",
  1224				   instruction_pointer(regs));
  1225			break;
  1226		case KDB_REASON_SSTEP:
  1227		case KDB_REASON_BREAK:
  1228			kdb_printf("due to %s @ " kdb_machreg_fmt "\n",
  1229				   reason == KDB_REASON_BREAK ?
  1230				   "Breakpoint" : "SS trap", instruction_pointer(regs));
  1231			/*
  1232			 * Determine if this breakpoint is one that we
  1233			 * are interested in.
  1234			 */
  1235			if (db_result != KDB_DB_BPT) {
  1236				kdb_printf("kdb: error return from kdba_bp_trap: %d\n",
  1237					   db_result);
  1238				KDB_DEBUG_STATE("kdb_local 6", reason);
  1239				return 0;	/* Not for us, dismiss it */
  1240			}
  1241			break;
  1242		case KDB_REASON_RECURSE:
  1243			kdb_printf("due to Recursion @ " kdb_machreg_fmt "\n",
  1244				   instruction_pointer(regs));
  1245			break;
  1246		default:
  1247			kdb_printf("kdb: unexpected reason code: %d\n", reason);
  1248			KDB_DEBUG_STATE("kdb_local 8", reason);
  1249			return 0;	/* Not for us, dismiss it */
  1250		}
  1251	
  1252		while (1) {
  1253			/*
  1254			 * Initialize pager context.
  1255			 */
  1256			kdb_nextline = 1;
  1257			KDB_STATE_CLEAR(SUPPRESS);
  1258			kdb_grepping_flag = 0;
  1259			/* ensure the old search does not leak into '/' commands */
  1260			kdb_grep_string[0] = '\0';
  1261	
  1262			cmdbuf = cmd_cur;
  1263			*cmdbuf = '\0';
  1264			*(cmd_hist[cmd_head]) = '\0';
  1265	
  1266	do_full_getstr:
  1267			/* PROMPT can only be set if we have MEM_READ permission. */
> 1268			snprintf(kdb_prompt_str, sizeof(kdb_prompt_str),
  1269				 kdbgetenv("PROMPT"), raw_smp_processor_id());
  1270	
  1271			/*
  1272			 * Fetch command from keyboard
  1273			 */
  1274			cmdbuf = kdb_getstr(cmdbuf, CMD_BUFLEN, kdb_prompt_str);
  1275			if (*cmdbuf != '\n') {
  1276				if (*cmdbuf < 32) {
  1277					if (cmdptr == cmd_head) {
  1278						strscpy(cmd_hist[cmd_head], cmd_cur,
  1279							CMD_BUFLEN);
  1280						*(cmd_hist[cmd_head] +
  1281						  strlen(cmd_hist[cmd_head])-1) = '\0';
  1282					}
  1283					if (!handle_ctrl_cmd(cmdbuf))
  1284						*(cmd_cur+strlen(cmd_cur)-1) = '\0';
  1285					cmdbuf = cmd_cur;
  1286					goto do_full_getstr;
  1287				} else {
  1288					strscpy(cmd_hist[cmd_head], cmd_cur,
  1289						CMD_BUFLEN);
  1290				}
  1291	
  1292				cmd_head = (cmd_head+1) % KDB_CMD_HISTORY_COUNT;
  1293				if (cmd_head == cmd_tail)
  1294					cmd_tail = (cmd_tail+1) % KDB_CMD_HISTORY_COUNT;
  1295			}
  1296	
  1297			cmdptr = cmd_head;
  1298			diag = kdb_parse(cmdbuf);
  1299			if (diag == KDB_NOTFOUND) {
  1300				drop_newline(cmdbuf);
  1301				kdb_printf("Unknown kdb command: '%s'\n", cmdbuf);
  1302				diag = 0;
  1303			}
  1304			if (diag == KDB_CMD_GO
  1305			 || diag == KDB_CMD_CPU
  1306			 || diag == KDB_CMD_SS
  1307			 || diag == KDB_CMD_KGDB)
  1308				break;
  1309	
  1310			if (diag)
  1311				kdb_cmderror(diag);
  1312		}
  1313		KDB_DEBUG_STATE("kdb_local 9", diag);
  1314		return diag;
  1315	}
  1316	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
